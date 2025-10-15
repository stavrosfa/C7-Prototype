
using System;
using System.Collections.Generic;
using System.IO;
using Serilog;

namespace C7GameData {

	// A class for interacting with the PediaIcons.txt file used in scenarios.
	class PediaIcons {
		private static readonly ILogger log = Log.ForContext<PediaIcons>();

		// A mapping from the civilopedia entry name (like PRTO_Spearman or
		// PRTO_Legionary_II) to the name used in the art directory (Spearman
		// and Legionary)
		private readonly Dictionary<string, string> unitArtMapping = new();

		// A mapping from the civilopedia entry name (like TECH_Map_Making) to
		// the small icon used in the science advisor display.
		private readonly Dictionary<string, string> techSmallIconMapping = new();

		// A mapping from the all caps name of a race (BABYLON, GERMANS,
		// RUSSIAN, etc) to the art file with happy/neutral/mad images of the
		// leader in each era, like `art\advisors\LZ_all.pcx`.
		private readonly Dictionary<string, string> raceToArtMapping = new();

		// A mapping from the building civilopedia name to the row within the
		// building icon art file.
		public readonly Dictionary<string, int> buildingToRowNumberMapping = new();

		public readonly List<string> buildingNoVariations = new();
		public readonly List<string> buildingEraVariations = new();
		public readonly List<string> buildingCustureVariations = new();
		public readonly Dictionary<string, string> buildingToCvlpdIconMapping = new();
		public readonly Dictionary<string, string> unitToCvlpdIconMapping = new();

		private readonly string pediaIconsPath;

		public PediaIcons(string path) {
			pediaIconsPath = path;
			string[] lines = File.ReadAllLines(path);

			string animNamePrefix = "#ANIMNAME_";
			for (int i = 0; i < lines.Length - 1; ++i) {
				if (lines[i].StartsWith(animNamePrefix)) {
					string civilopediaName = lines[i].Substring(animNamePrefix.Length);
					if (civilopediaName.Contains("_ERAS_")) {
						// HACK: The civilopedia name for leaders differs by era, but the current
						// approach for resolving the artwork is era independent. Given a line like
						// #ANIMNAME_PRTO_Leader_ERAS_Ancient_Times we want to end up with
						// PRTO_Leader to match the biq file.
						civilopediaName = civilopediaName.Substring(0, civilopediaName.IndexOf("_ERAS_"));
					}

					string artName = lines[i + 1];
					unitArtMapping[civilopediaName] = artName;
					continue;
				}

				if (lines[i].StartsWith("#TECH") && !lines[i].EndsWith("_LARGE")) {
					// Drop the # from the line to get the civilopedia name
					// and then the next line is the icon path.
					techSmallIconMapping[lines[i].Substring(1)] = lines[i + 1];
				}

				if (lines[i].StartsWith("#RACE") && i + 2 < lines.Length) {
					// +2 because the line at +1 is the leaderheads neutral
					// victory image.
					raceToArtMapping[lines[i]] = lines[i + 2];
				}

				if (lines[i].StartsWith("#ICON_BLDG") && i + 2 < lines.Length) {
					// +2 because +1 specifies if the building has different
					// columns for culture groups or by era. We don't try to
					// support that yet.

					string biqName = lines[i].Substring(6);

					buildingToRowNumberMapping[biqName] = Int32.Parse(lines[i + 2]);

					if (lines[i + 1].Trim() == "SINGLE" && i + 10 < lines.Length) {
						buildingToCvlpdIconMapping[$"{biqName}_LARGE"] = lines[i + 3];
						buildingToCvlpdIconMapping[$"{biqName}_SMALL"] = lines[i + 4];

						buildingNoVariations.Add(biqName);
					}
					else if (lines[i + 1].Trim() == "ERA") {
						buildingToCvlpdIconMapping[$"{biqName}_ANCIENT_LARGE"] = lines[i + 3];
						buildingToCvlpdIconMapping[$"{biqName}_MIDDLE_LARGE"] = lines[i + 4];
						buildingToCvlpdIconMapping[$"{biqName}_INDUSTRIAL_LARGE"] = lines[i + 5];
						buildingToCvlpdIconMapping[$"{biqName}_MODERN_LARGE"] = lines[i + 6];
						buildingToCvlpdIconMapping[$"{biqName}_ANCIENT_SMALL"] = lines[i + 7];
						buildingToCvlpdIconMapping[$"{biqName}_MIDDLE_SMALL"] = lines[i + 8];
						buildingToCvlpdIconMapping[$"{biqName}_INDUSTRIAL_SMALL"] = lines[i + 9];
						buildingToCvlpdIconMapping[$"{biqName}_MODERN_SMALL"] = lines[i + 10];

						buildingEraVariations.Add(biqName);
					}
					else if (lines[i + 1].Trim() == "CULTURE" && i + 12 < lines.Length) {
						buildingToCvlpdIconMapping[$"{biqName}_AMERICAN_LARGE"] = lines[i + 3];
						buildingToCvlpdIconMapping[$"{biqName}_EUROPEAN_LARGE"] = lines[i + 4];
						buildingToCvlpdIconMapping[$"{biqName}_MEDITERRANEAN_LARGE"] = lines[i + 5];
						buildingToCvlpdIconMapping[$"{biqName}_MIDEASTERN_LARGE"] = lines[i + 6];
						buildingToCvlpdIconMapping[$"{biqName}_ASIAN_LARGE"] = lines[i + 7];
						buildingToCvlpdIconMapping[$"{biqName}_AMERICAN_SMALL"] = lines[i + 8];
						buildingToCvlpdIconMapping[$"{biqName}_EUROPEAN_SMALL"] = lines[i + 9];
						buildingToCvlpdIconMapping[$"{biqName}_MEDITERRANEAN_SMALL"] = lines[i + 10];
						buildingToCvlpdIconMapping[$"{biqName}_MIDEASTERN_SMALL"] = lines[i + 11];
						buildingToCvlpdIconMapping[$"{biqName}_ASIAN_SMALL"] = lines[i + 12];

						buildingCustureVariations.Add(biqName);
					}
				}

				if (lines[i].StartsWith("#ICON_PRTO") && i + 2 < lines.Length) {
					string biqName = lines[i].Substring(6);

					unitToCvlpdIconMapping[$"{biqName}_LARGE"] = lines[i + 1];
					unitToCvlpdIconMapping[$"{biqName}_SMALL"] = lines[i + 2];
				}
			}
		}

		public string GetTechIconPath(string civilopediaEntry) {
			return techSmallIconMapping[civilopediaEntry];
		}

		public string GetUnitArtName(string civilopediaEntry) {
			string artName = unitArtMapping[civilopediaEntry];
			if (artName == null) {
				log.Error($"Could not find #ANIMNAME_{civilopediaEntry} in PediaIcons file '{pediaIconsPath}");
				return "Warrior";
			}
			return artName;
		}

		public string GetLeaderArtName(string civilopediaEntry) {
			string key = "#" + civilopediaEntry.ToUpper();
			if (!raceToArtMapping.ContainsKey(key)) {
				return null;
			}
			return raceToArtMapping[key];
		}
	}

}
