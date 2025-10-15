using System.Collections.Generic;
using System.Linq;
using System.Text.Json.Serialization;

namespace C7GameData.Save {
	public class SaveBuilding {
		public enum Flag {
			IsCenterOfEmpire,
			VeteranGroundUnits,
			VeteranSeaUnits,
			MustBeCoastal,
			MustBeNearRiver,
			IncreasesLuxuryTrade,
			ReducesCorruption,
			ForbiddenPalace,
			IncreasesShieldsInWater,
			IncreasesFoodInWater,
			IncreasesTradeInWater,
			AllowsCitySize2,
			AllowsCitySize3,
			DoublesCityGrowthRate,
			ProvidesWalls,
			CanOnlyBeBuiltInTowns,
		}

		public class GreatWonderProperties {
			// The name of the building this building gives to every city in the
			// empire on on the continent (like the pyramids or the internet).
			public string buildingGainedInEveryCity;
			public string buildingGainedInEveryCityOnContinent;
		}

		public class IconTexture {
			public string smallIconTexture;
			public string largeIconTexture;
		}

		public class CultureVariationTexture {
			public IconTexture american;
			public IconTexture european;
			public IconTexture mediterranean;
			public IconTexture mideastern;
			public IconTexture asian;
		}
		public class EraVariationTexture {
			public IconTexture ancient;
			public IconTexture middle;
			public IconTexture industrial;
			public IconTexture modern;
		}

		public string name;
		public int shieldCost;
		public int populationCost;
		public ID requiredTech;
		public string requiredBuilding;
		public GreatWonderProperties? greatWonderProperties;
		public bool isSmallWonder;
		public int culturePerTurn;
		public int contentFacesInCity;
		public double combatDefenseBonus;
		public int maintenanceCost;
		public int iconRowIndex;
		public ID? renderedObsoleteBy;

		[JsonIgnore]
		public IconTexture iconTextures;
		[JsonIgnore]
		public CultureVariationTexture cultureVariationTextures;
		[JsonIgnore]
		public EraVariationTexture eraVariationTextures;

		// Assorted boolean flags for the building. They're stored in this set
		// rather than as booleans to avoid bloating the json file.
		public HashSet<Flag> flags = new();

		// The set of traits this building has. Civilizations with a matching
		// trait get discounted production costs.
		public HashSet<Civilization.Trait> traits = new();

		public HashSet<string> requiredResources = [];

		// Paths to Lua functions
		public SortedSet<string> onFinishedUnitProduction = [];
		public SortedSet<string> productionPrerequisites = [];
		public SortedSet<string> tileModifiers = [];

		public SaveBuilding() { }
	}
}
