-- Base paths
local ADVISORS = "Art/Advisors/"

local BUTTONS = "Art/buttonsFINAL.pcx"
local EXIT_BOX = "Art/exitBox-backgroundStates.pcx"
local INTERFACE = "Art/interface/"
local X_O = "Art/X-o_ALLstates-sprite.pcx"
local SCIENCE_NAV = "Art/Tech Chooser/scienceNAV.pcx"

local CITY_SCREEN = "Art/city screen/"
local CITY_BUTTONS = "Art/city screen/cityMgmtButtons.pcx"
local CITY_PRODUCTION = "Art/city screen/ProdButton.pcx"
local CITY_SCREEN_ICONS = "Art/city screen/CityIcons.pcx"

local CITY_ICONS = "Art/Cities/city icons.pcx"

local CREDITS = "Art/Credits/"
local PALACE = "Art/PalaceView/"

local POPUP_BORDERS = "Art/popupborders.pcx"

local CIVILOPEDIA_UNITS = "Art/Civilopedia/Icons/Units/"
local CIVILOPEDIA_BUILDINGS = "Art/Civilopedia/Icons/Buildings/"

-- Texture definitions
local textures = {}

textures.advisors = {
  dialog_box = ADVISORS .. "dialogbox.pcx",
  science = {
    background = {
      ancient = ADVISORS .. "science_ancient.pcx",
      middle = ADVISORS .. "science_middle.pcx",
      industrial = ADVISORS .. "science_industrial_new.pcx",
      modern = ADVISORS .. "science_modern.pcx",
    },
    navigation = {
      button = {
        normal = {
          path = SCIENCE_NAV,
          crop_region = { 0, 1, 129, 33 },
        },
        hover = {
          path = SCIENCE_NAV,
          crop_region = { 0, 35, 129, 33 },
        },
        pressed = {
          path = SCIENCE_NAV,
          crop_region = { 0, 69, 129, 33 },
        },
      },
      arrow_previous = {
        path = SCIENCE_NAV,
        crop_region = { 0, 103, 44, 9 },
      },
      arrow_next = {
        path = SCIENCE_NAV,
        crop_region = { 46, 103, 44, 9 },
      },
    },
  },
  military = {
    background = ADVISORS .. "military.pcx",
  },
  domestic = {
    background = ADVISORS .. "domestic.pcx",
    button = {
      normal = {
        path = ADVISORS .. "domesticBUTTON.pcx",
        crop_region = { 1, 1, 145, 24 },
      },
      hover = {
        path = ADVISORS .. "domesticBUTTON.pcx",
        crop_region = { 1, 26, 145, 24 },
      },
      pressed = {
        path = ADVISORS .. "domesticBUTTON.pcx",
        crop_region = { 1, 52, 145, 24 },
      },
    },
  },
}

function add_tables(t1, t2)
	result = {}
	for i = 1, math.min(#t1, #t2) do
		result[i] = t1[i] + t2[i]
	end
	return result
end

tech_boxes_texture = ADVISORS .. "techboxes.pcx"

-- different era boxes have slightly different sizes
-- this is the max size they could be
-- seeing where the "Not required" sign renders in the original as well
-- this is probably how they did it originally
tbl_small = { 1, 1, 106, 82 }
tbl_medium = { 1, 84, 163, 82 }
tbl_large = { 1, 167, 163, 106 }
tbl_long = { 1, 274, 188, 82 }

local function create_entry(offset)
	local entry = {
		small = {
			path = tech_boxes_texture,
			crop_region = add_tables(tbl_small, offset),
		},
		medium = {
			path = tech_boxes_texture,
			crop_region = add_tables(tbl_medium, offset),
		},
		large = {
			path = tech_boxes_texture,
			crop_region = add_tables(tbl_large, offset),
		},
		long = {
			path = tech_boxes_texture,
			crop_region = add_tables(tbl_long, offset),
		},
	}
	return entry
end

textures.tech_box = {
  known = {
	  ancient = create_entry({0, 0, 0, 0}),
	  middle = create_entry({0, 356, 0, 0}),
	  industrial = create_entry({0, 712, 0, 0}),
	  modern = create_entry({0, 1068, 0, 0}),
  },
  in_progress = {
	  ancient = create_entry({189, 0, 0, 0}),
	  middle = create_entry({189, 356, 0, 0}),
	  industrial = create_entry({189, 712, 0, 0}),
	  modern = create_entry({189, 1068, 0, 0}),
  },
  possible = {
	  ancient = create_entry({378, 0, 0, 0}),
	  middle = create_entry({378, 356, 0, 0}),
	  industrial = create_entry({378, 712, 0, 0}),
	  modern = create_entry({378, 1068, 0, 0}),
  },
  blocked = {
	  ancient = create_entry({567, 0, 0, 0}),
	  middle = create_entry({567, 356, 0, 0}),
	  industrial = create_entry({567, 712, 0, 0}),
	  modern = create_entry({567, 1068, 0, 0}),
  },
  non_required = ADVISORS .. "non_required.pcx",
}

textures.ui = {
  button = {
    inactive = {
      path = BUTTONS,
      crop_region = { 1, 1, 20, 20 },
      shadows = false,
    },
    hover = {
      path = BUTTONS,
      crop_region = { 22, 1, 20, 20 },
      shadows = false,
    },
    pressed = {
      path = BUTTONS,
      crop_region = { 43, 1, 20, 20 },
      shadows = false,
    },
  },
  confirm = {
    normal = {
      path = X_O,
      crop_region = { 1, 1, 19, 19 },
    },
    hover = {
      path = X_O,
      crop_region = { 37, 1, 19, 19 },
    },
    pressed = {
      path = X_O,
      crop_region = { 73, 1, 19, 19 },
    },
  },
  cancel = {
    normal = {
      path = X_O,
      crop_region = { 21, 1, 15, 19 },
    },
    hover = {
      path = X_O,
      crop_region = { 57, 1, 15, 19 },
    },
    pressed = {
      path = X_O,
      crop_region = { 93, 1, 15, 19 },
    },
  },
  console = {
    normal = {
      path = INTERFACE .. "consoleButtons.pcx",
      crop_region = { 1, 1, 16, 16 },
    },
    hover = {
      path = INTERFACE .. "consoleButtons.pcx",
      crop_region = { 17, 1, 16, 16 },
    },
    pressed = {
      path = INTERFACE .. "consoleButtons.pcx",
      crop_region = { 33, 1, 16, 16 },
    },
  },
  exit = {
    normal = {
      path = EXIT_BOX,
      crop_region = { 0, 0, 72, 48 },
    },
    hover = {
      path = EXIT_BOX,
      crop_region = { 72, 0, 72, 48 },
    },
    pressed = {
      path = EXIT_BOX,
      crop_region = { 144, 0, 72, 48 },
    },
  },
}

textures.terrain = require "civ3.terrain"

textures.resources = require "civ3.resources"

textures.credits = {
  background = CREDITS .. "credits_background.pcx",
}

textures.icons = {
  science = {
    path = CITY_SCREEN_ICONS,
    crop_region = { 34, 2, 30, 30 },
  },
  beaker = {
    path = CITY_SCREEN_ICONS,
    crop_region = { 34, 2, 29, 29 },
  },
  good_gold = {
	  path = CITY_SCREEN_ICONS,
	  crop_region = { 64, 2, 29, 29 },
  },
  commerce = {
    path = CITY_SCREEN_ICONS,
    crop_region = { 67, 1, 21, 30 },
  },
  wasted_gold = {
    path = CITY_SCREEN_ICONS,
    crop_region = { 95, 2, 30, 30 },
  },
  good_shield = {
	  path = CITY_SCREEN_ICONS,
	  crop_region = { 129, 5, 22, 22 },
  },
  shield = {
    path = CITY_SCREEN_ICONS,
    crop_region = { 133, 1, 16, 30 },
  },
  wasted_shield = {
	  path = CITY_SCREEN_ICONS,
	  crop_region = { 160, 5, 22, 22 },
  },
  full_food = {
	  path = CITY_SCREEN_ICONS,
	  crop_region = { 191, 7, 20, 20 },
  },
  food = {
	  path = CITY_SCREEN_ICONS,
	  crop_region = { 195, 1, 21, 30 },
  },
  eaten_food = {
	  path = CITY_SCREEN_ICONS,
	  crop_region = { 223, 7, 20, 20 },
  },
  empty_shield = {
	  path = CITY_SCREEN_ICONS,
	  crop_region = { 253, 5, 22, 22 },
  },
  empty_food = {
	  path = CITY_SCREEN_ICONS,
	  crop_region = { 284, 7, 20, 20 },
  },
  no_food = {
	  path = CITY_SCREEN_ICONS,
	  crop_region = { 315, 7, 20, 20 },
  },
  luxury = {
    path = CITY_SCREEN_ICONS,
    crop_region = { 376, 2, 30, 30 },
  },
  happy_face = {
	  path = CITY_SCREEN_ICONS,
	  crop_region = { 373, 2, 29, 29 },
  },
  effect_smiley_face = {
    path = CITY_SCREEN_ICONS,
    crop_region = { 373, 1, 30, 30 },
  },
  effect_shield = {
    path = CITY_SCREEN_ICONS,
    crop_region = { 404, 1, 30, 30 },
  },
  effect_good_gold = {
    path = CITY_SCREEN_ICONS,
    crop_region = { 435, 1, 30, 30 },
  },
  effect_beaker = {
    path = CITY_SCREEN_ICONS,
    crop_region = { 497, 1, 30, 30 },
  },
  effect_wasted_gold = {
    path = CITY_SCREEN_ICONS,
    crop_region = { 528, 1, 30, 30 },
  },
  content_face = {
	  path = CITY_SCREEN_ICONS,
	  crop_region = { 591, 2, 29, 29 },
  },
  treasury = {
	  path = CITY_SCREEN_ICONS,
	  crop_region = { 746, 2, 29, 29 },
  },
  plus = {
    path = ADVISORS .. "domestic_icons_aux.pcx",
    crop_region = { 75, 1, 22, 22 },
  },
  minus = {
    path = ADVISORS .. "domestic_icons_aux.pcx",
    crop_region = { 51, 1, 22, 22 },
  },
  capital_star = {
    path = CITY_ICONS,
    crop_region = { 20, 1, 18, 18 },
  },
}

textures.city_screen = {
  background = "Art/city screen/background.pcx",
  buttons = {
    close = {
      normal = {
        path = CITY_BUTTONS,
        crop_region = { 155, 1, 38, 48 },
      },
      hover = {
        path = CITY_BUTTONS,
        crop_region = { 155, 50, 38, 48 },
      },
      pressed = {
        path = CITY_BUTTONS,
        crop_region = { 155, 99, 38, 48 },
      },
    },
    previous = {
      normal = {
        path = CITY_BUTTONS,
        crop_region = { 1, 1, 48, 48 },
      },
      hover = {
        path = CITY_BUTTONS,
        crop_region = { 1, 50, 48, 48 },
      },
      pressed = {
        path = CITY_BUTTONS,
        crop_region = { 1, 99, 48, 48 },
      },
    },
    next = {
      normal = {
        path = CITY_BUTTONS,
        crop_region = { 42, 1, 48, 48 },
      },
      hover = {
        path = CITY_BUTTONS,
        crop_region = { 42, 50, 48, 48 },
      },
      pressed = {
        path = CITY_BUTTONS,
        crop_region = { 42, 99, 48, 48 },
      },
    },
    production = {
      normal = {
        path = CITY_PRODUCTION,
        crop_region = { 1, 0, 114, 95 },
      },
      hover = {
        path = CITY_PRODUCTION,
        crop_region = { 116, 0, 115, 95 },
      },
      pressed = {
        path = CITY_PRODUCTION,
        crop_region = { 231, 0, 115, 95 },
      },
    },
  },
  production_queue = CITY_SCREEN .. "ProductionQueueBox.pcx",
}

textures.palace = {
  background = PALACE .. "bkgr.pcx",
}

textures.world_setup = require "civ3.world_setup"
textures.player_setup = require "civ3.player_setup"

textures.diplomacy = {
  deal = "Art/Diplomacy/counter.pcx",
  offer = "Art/Diplomacy/talk_offer.pcx",
}

textures.upper_left_navigation = {
  menu = {
    path = INTERFACE .. "menuButtons.pcx",
    alpha = INTERFACE .. "menuButtonsAlpha.pcx",
    crop_region = { 0, 1, 35, 29 },
  },
  civilopedia = {
    path = INTERFACE .. "menuButtons.pcx",
    alpha = INTERFACE .. "menuButtonsAlpha.pcx",
    crop_region = { 36, 1, 35, 29 },
  },
  advisor = {
    normal = {
      path = INTERFACE .. "menuButtons.pcx",
      alpha = INTERFACE .. "menuButtonsAlpha.pcx",
      crop_region = { 73, 1, 35, 29 },
    },
    hover = {
      path = INTERFACE .. "menuButtons.pcx",
      alpha = INTERFACE .. "menuButtonsAlpha.pcx",
      alpha_row_offset = 60,
      crop_region = { 73, 61, 35, 29 },
    },
    pressed = {
      path = INTERFACE .. "menuButtons.pcx",
      alpha = INTERFACE .. "menuButtonsAlpha.pcx",
      alpha_row_offset = 120,
      crop_region = { 73, 121, 35, 29 },
    },
  },
}

textures.lower_right_infobox = {
  box = {
    path = INTERFACE .. "box right color.pcx",
    alpha = INTERFACE .. "box right alpha.pcx",
  },
  next_turn = {
    off = {
      path = INTERFACE .. "nextturn states color.pcx",
      alpha = INTERFACE .. "nextturn states alpha.pcx",
      crop_region = { 0, 0, 47, 28 },
    },
    on = {
      path = INTERFACE .. "nextturn states color.pcx",
      alpha = INTERFACE .. "nextturn states alpha.pcx",
      crop_region = { 47, 0, 47, 28 },
    },
    blink = {
      path = INTERFACE .. "nextturn states color.pcx",
      alpha = INTERFACE .. "nextturn states alpha.pcx",
      crop_region = { 94, 0, 47, 28 },
    },
  },
}

textures.popup_background = {
  top_left = {
    path = POPUP_BORDERS,
    crop_region = { 251, 1, 61, 44 },
  },
  top_center = {
    path = POPUP_BORDERS,
    crop_region = { 313, 1, 61, 44 },
  },
  top_right = {
    path = POPUP_BORDERS,
    crop_region = { 375, 1, 61, 44 },
  },
  middle_left = {
    path = POPUP_BORDERS,
    crop_region = { 251, 46, 61, 44 },
  },
  middle_center = {
    path = POPUP_BORDERS,
    crop_region = { 313, 46, 61, 44 },
  },
  middle_right = {
    path = POPUP_BORDERS,
    crop_region = { 375, 46, 61, 44 },
  },
  bottom_left = {
    path = POPUP_BORDERS,
    crop_region = { 251, 91, 61, 44 },
  },
  bottom_center = {
    path = POPUP_BORDERS,
    crop_region = { 313, 91, 61, 44 },
  },
  bottom_right = {
    path = POPUP_BORDERS,
    crop_region = { 375, 91, 61, 44 },
  },
}

textures.animations = {
  cursor = {
    path = "Art/Animations/Cursor/Cursor.flc",
  },
  disorder = {
    path = "Art/Animations/Disorder/DisorderDefault.flc",
  },
}

textures.civilopedia_units = {
	aegis_cruiser = {
		small = { path = CIVILOPEDIA_UNITS .. "39AegisCruisersmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "39AegisCruiserlarge.pcx" },
	},
	f_15 = {
		small = { path = CIVILOPEDIA_UNITS .. "64AmericanF15small.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "64AmericanF15large.pcx" },
	},
	ansar_warrior = {
		small = { path = CIVILOPEDIA_UNITS .. "x_Ansar Warrior civpedia sm.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "x_Ansar Warrior civpedia lg.pcx" },
	},
	archer = {
		small = { path = CIVILOPEDIA_UNITS .. "07Archersmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "07Archerlarge.pcx" },
	},
	army = {
		small = { path = CIVILOPEDIA_UNITS .. "48Armysmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "48Armylarge.pcx" },
	},
	artillery = {
		small = { path = CIVILOPEDIA_UNITS .. "24Artillerysmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "24Artillerylarge.pcx" },
	},
	jaguar_warrior = {
		small = { path = CIVILOPEDIA_UNITS .. "49AztecJaguarWarriorsmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "49AztecJaguarWarriorlarge.pcx" },
	},
	berserk = {
		small = { path = CIVILOPEDIA_UNITS .. "x_berserk civpedia sm.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "x_berserk civpedia lg.pcx" },
	},
	bomber = {
		small = { path = CIVILOPEDIA_UNITS .. "42Bombersmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "42Bomberlarge.pcx" },
	},
	bowman = {
		small = { path = CIVILOPEDIA_UNITS .. "50Bowman(BabylonianArcher)small.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "50Bowman(BabylonianArcher)large.pcx" },
	},
	cannon = {
		small = { path = CIVILOPEDIA_UNITS .. "23Cannonsmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "23Cannonlarge.pcx" },
	},
	caravel = {
		small = { path = CIVILOPEDIA_UNITS .. "30Caravelsmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "30Caravellarge.pcx" },
	},
	carrack = {
		small = { path = CIVILOPEDIA_UNITS .. "x2_carrack civpedia sm.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "x2_carrack civpedia lg.pcx" },
	},
	catapult = {
		small = { path = CIVILOPEDIA_UNITS .. "22Catapultsmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "22Catapultlarge.pcx" },
	},
	cavalry = {
		small = { path = CIVILOPEDIA_UNITS .. "17Cavalrysmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "17Cavalrylarge.pcx" },
	},
	chariot = {
		small = { path = CIVILOPEDIA_UNITS .. "10Chariotsmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "10Chariotlarge.pcx" },
	},
	chasqui_scout = {
		small = { path = CIVILOPEDIA_UNITS .. "x2_ChasquisScout civpedia sm.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "x2_ChasquisScout civpedia lg.pcx" },
	},
	conquistador = {
		small = { path = CIVILOPEDIA_UNITS .. "x_conquist civpedia sm.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "x_conquist civpedia lg.pcx" },
	},
	cruiser = {
		small = { path = CIVILOPEDIA_UNITS .. "x2_HvCruiser civpedia sm.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "x2_HvCruiser civpedia lg.pcx" },
	},
	curragh = {
		small = { path = CIVILOPEDIA_UNITS .. "x2_Curragh civpedia sm.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "x2_Curragh civpedia lg.pcx" },
	},
	rider = {
		small = { path = CIVILOPEDIA_UNITS .. "56ChineseHorsemansmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "56ChineseHorsemanlarge.pcx" },
	},
	cruise_missile = {
		small = { path = CIVILOPEDIA_UNITS .. "26CruiseMissilesmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "26CruiseMissilelarge.pcx" },
	},
	destroyer = {
		small = { path = CIVILOPEDIA_UNITS .. "37Destroyersmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "37Destroyerlarge.pcx" },
	},
	dromon = {
		small = { path = CIVILOPEDIA_UNITS .. "x2_Dromon civpedia sm.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "x2_Dromon civpedia lg.pcx" },
	},
	war_chariot = {
		small = { path = CIVILOPEDIA_UNITS .. "55EgyptianChariotsmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "55EgyptianChariotlarge.pcx" },
	},
	man_o_war = {
		small = { path = CIVILOPEDIA_UNITS .. "63EnglishManoWarsmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "63EnglishManoWarlarge.pcx" },
	},
	enkidu_warrior = {
		small = { path = CIVILOPEDIA_UNITS .. "x2_Endiku civpedia sm.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "x2_Endiku civpedia lg.pcx" },
	},
	explorer = {
		small = { path = CIVILOPEDIA_UNITS .. "03Explorersmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "03Explorerlarge.pcx" },
	},
	fighter = {
		small = { path = CIVILOPEDIA_UNITS .. "41Fightersmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "41Fighterlarge.pcx" },
	},
	flak = {
		small = { path = CIVILOPEDIA_UNITS .. "X2_20mmQuadFlak38_sm.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "X2_20mmQuadFlak38_lg.pcx" },
	},
	gallic_swordsman = {
		small = { path = CIVILOPEDIA_UNITS .. "x_gallic swordsman civpedia sm.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "x_gallic swordsman civpedia lg.pcx" },
	},
	hwacha = {
		small = { path = CIVILOPEDIA_UNITS .. "x_hwacha civpedia sm.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "x_hwacha civpedia lg.pcx" },
	},
	javelin_thrower = {
		small = { path = CIVILOPEDIA_UNITS .. "x2_JavelinThrower civpedia sm.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "x2_JavelinThrower civpedia lg.pcx" },
	},
	musketeer = {
		small = { path = CIVILOPEDIA_UNITS .. "58FrenchMusketeersmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "58FrenchMusketeerlarge.pcx" },
	},
	frigate = {
		small = { path = CIVILOPEDIA_UNITS .. "31Frigatesmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "31Frigatelarge.pcx" },
	},
	galleon = {
		small = { path = CIVILOPEDIA_UNITS .. "32Galleonsmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "32Galleonlarge.pcx" },
	},
	galley = {
		small = { path = CIVILOPEDIA_UNITS .. "29Galley(Trireme)small.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "29Galley(Trireme)large.pcx" },
	},
	guerilla = {
		small = { path = CIVILOPEDIA_UNITS .. "x_Guerilla civpedia sm.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "x_Guerilla civpedia lg.pcx" },
	},
	panzer = {
		small = { path = CIVILOPEDIA_UNITS .. "62GermanPanzersmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "62GermanPanzerlarge.pcx" },
	},
	hoplite = {
		small = { path = CIVILOPEDIA_UNITS .. "51Hoplite(GreekPhalanx)small.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "51Hoplite(GreekPhalanx)large.pcx" },
	},
	mounted_warrior = {
		small = { path = CIVILOPEDIA_UNITS .. "57HorseArchersmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "57HorseArcherlarge.pcx" },
	},
	horseman = {
		small = { path = CIVILOPEDIA_UNITS .. "11Horsemansmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "11Horsemanlarge.pcx" },
	},
	icbm = {
		small = { path = CIVILOPEDIA_UNITS .. "28ICBMsmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "28ICBMlarge.pcx" },
	},
	tactical_nuke = {
		small = { path = CIVILOPEDIA_UNITS .. "27ICBMtacticalsmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "27ICBMtacticallarge.pcx" },
	},
	immortals = {
		small = { path = CIVILOPEDIA_UNITS .. "54Immortalsmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "54Immortallarge.pcx" },
	},
	infantry = {
		small = { path = CIVILOPEDIA_UNITS .. "18Infantrysmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "18Infantrylarge.pcx" },
	},
	battleship = {
		small = { path = CIVILOPEDIA_UNITS .. "38IowaBattleshipsmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "38IowaBattleshiplarge.pcx" },
	},
	ironclad = {
		small = { path = CIVILOPEDIA_UNITS .. "33Ironcladsmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "33Ironcladlarge.pcx" },
	},
	samurai = {
		small = { path = CIVILOPEDIA_UNITS .. "59JapaneseSamuraismall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "59JapaneseSamurailarge.pcx" },
	},
	jet_fighter = {
		small = { path = CIVILOPEDIA_UNITS .. "44JetFightersmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "44JetFighterlarge.pcx" },
	},
	keshik = {
		small = { path = CIVILOPEDIA_UNITS .. "x_keshik civpedia sm.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "x_keshik civpedia lg.pcx" },
	},
	knight = {
		small = { path = CIVILOPEDIA_UNITS .. "15Knightsmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "15Knightlarge.pcx" },
	},
	leader = {
		small = { path = CIVILOPEDIA_UNITS .. "47Leadersmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "47Leaderlarge.pcx" },
	},
	longbowman = {
		small = { path = CIVILOPEDIA_UNITS .. "13Longbowmansmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "13Longbowmanlarge.pcx" },
	},
	marine = {
		small = { path = CIVILOPEDIA_UNITS .. "04Marinesmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "04Marinelarge.pcx" },
	},
	mech_infantry = {
		small = { path = CIVILOPEDIA_UNITS .. "20MechanizedInfantrysmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "20MechanizedInfantrylarge.pcx" },
	},
	modern_armor = {
		small = { path = CIVILOPEDIA_UNITS .. "21ModernArmorsmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "21ModernArmorlarge.pcx" },
	},
	musketman = {
		small = { path = CIVILOPEDIA_UNITS .. "14Musketmansmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "14Musketmanlarge.pcx" },
	},
	carrier = {
		small = { path = CIVILOPEDIA_UNITS .. "35Nimitzsmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "35Nimitzlarge.pcx" },
	},
	nuclear_submarine = {
		small = { path = CIVILOPEDIA_UNITS .. "40NuclearSubmarinesmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "40NuclearSubmarinelarge.pcx" },
	},
	numidian_mercenary = {
		small = { path = CIVILOPEDIA_UNITS .. "x_Libyan Mercenary civpedia sm.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "x_Libyan Mercenary civpedia lg.pcx" },
	},
	medieval_infantry = {
		small = { path = CIVILOPEDIA_UNITS .. "x_Medieval infantry civpedia sm.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "x_Medieval infantry civpedia lg.pcx" },
	},
	mobile_sam = {
		small = { path = CIVILOPEDIA_UNITS .. "x2_MobileSAM sm.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "x2_MobileSAM lg.pcx" },
	},
	modern_paratrooper = {
		small = { path = CIVILOPEDIA_UNITS .. "05Paratroopersmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "05Paratrooperlarge.pcx" },
	},
	paratrooper = {
		small = { path = CIVILOPEDIA_UNITS .. "X2_WWIIParatrooper_sm.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "X2_WWIIParatrooper_lg.pcx" },
	},
	pikeman = {
		small = { path = CIVILOPEDIA_UNITS .. "12Pikemansmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "12Pikemanlarge.pcx" },
	},
	privateer = {
		small = { path = CIVILOPEDIA_UNITS .. "65Privateersmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "65Privateerlarge.pcx" },
	},
	radar_artillery = {
		small = { path = CIVILOPEDIA_UNITS .. "25RadarArtillerysmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "25RadarArtillerylarge.pcx" },
	},
	rifleman = {
		small = { path = CIVILOPEDIA_UNITS .. "16Riflemansmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "16Riflemanlarge.pcx" },
	},
	legionary = {
		small = { path = CIVILOPEDIA_UNITS .. "53RomanLegionsmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "53RomanLegionlarge.pcx" },
	},
	cossack = {
		small = { path = CIVILOPEDIA_UNITS .. "61RussianCossacksmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "61RussianCossacklarge.pcx" },
	},
	--scout(iroquoiswarrior)?? = {
	--	small = { path = CIVILOPEDIA_UNITS .. "02Scout(IroquoisWarrior)small.pcx" },
	--	large = { path = CIVILOPEDIA_UNITS .. "02Scout(IroquoisWarrior)large.pcx" },
	--},
	settler = {
		small = { path = CIVILOPEDIA_UNITS .. "00Settlersmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "00Settlerlarge.pcx" },
	},
	tank = {
		small = { path = CIVILOPEDIA_UNITS .. "19ShermanTanksmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "19ShermanTanklarge.pcx" },
	},
	trebuchet = {
		small = { path = CIVILOPEDIA_UNITS .. "x2_Trebuchet civpedia sm.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "x2_Trebuchet civpedia lg.pcx" },
	},
	sipahi = {
		small = { path = CIVILOPEDIA_UNITS .. "x_sipahi civpedia sm.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "x_sipahi civpedia lg.pcx" },
	},
	spearman = {
		small = { path = CIVILOPEDIA_UNITS .. "08Spearmansmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "08Spearmanlarge.pcx" },
	},
	stealth_bomber = {
		small = { path = CIVILOPEDIA_UNITS .. "46StealthBombersmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "46StealthBomberlarge.pcx" },
	},
	stealth_fighter = {
		small = { path = CIVILOPEDIA_UNITS .. "45StealthFightersmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "45StealthFighterlarge.pcx" },
	},
	submarine = {
		small = { path = CIVILOPEDIA_UNITS .. "36Submarinesmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "36Submarinelarge.pcx" },
	},
	swiss_mercenary = {
		small = { path = CIVILOPEDIA_UNITS .. "x2_SwissMerc civpedia sm.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "x2_SwissMerc civpedia lg.pcx" },
	},
	swordsman = {
		small = { path = CIVILOPEDIA_UNITS .. "09Swordsmansmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "09Swordsmanlarge.pcx" },
	},
	three_man_chariot = {
		small = { path = CIVILOPEDIA_UNITS .. "X2_3ManChariot civpedia sm.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "X2_3ManChariot civpedia lg.pcx" },
	},
	transport = {
		small = { path = CIVILOPEDIA_UNITS .. "34Transportsmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "34Transportlarge.pcx" },
	},
	tow_infantry = {
		small = { path = CIVILOPEDIA_UNITS .. "x2_TOWinfantrry_civpedia sm.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "x2_TOWinfantrry_civpedia lg.pcx" },
	},
	helicopter = {
		small = { path = CIVILOPEDIA_UNITS .. "43TransportHelicoptersmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "43TransportHelicopterlarge.pcx" },
	},
	war_elephant = {
		small = { path = CIVILOPEDIA_UNITS .. "60WarElephantsmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "60WarElephantlarge.pcx" },
	},
	warrior = {
		small = { path = CIVILOPEDIA_UNITS .. "06Warriorsmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "06Warriorlarge.pcx" },
	},
	worker = {
		small = { path = CIVILOPEDIA_UNITS .. "01Workersmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "01Workerlarge.pcx" },
	},
	impi = {
		small = { path = CIVILOPEDIA_UNITS .. "52ZuluSpearmansmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "52ZuluSpearmanlarge.pcx" },
	},
	scout = {
		small = { path = CIVILOPEDIA_UNITS .. "02scoutsmall.pcx" },
		large = { path = CIVILOPEDIA_UNITS .. "02scoutlarge.pcx" },
	},
}

textures.civilopedia_buildings = {
	airport = {
		ancient = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "AirportINDsmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "AirportINDlarge.pcx" },
		},
		middle = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "AirportINDsmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "AirportINDlarge.pcx" },
		},
		industrial = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "AirportINDsmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "AirportINDlarge.pcx" },
		},
		modern = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "AirportMODsmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "AirportMODlarge.pcx" },
		},
	},
	apollo_program = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "Apollosmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "Apollolarge.pcx" },
	},
	aqueduct = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "Aqueductsmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "Aqueductlarge.pcx" },
	},
	bank = {
		ancient = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "BankRensmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "BankRenlarge.pcx" },
		},
		middle = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "BankRensmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "BankRenlarge.pcx" },
		},
		industrial = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "BankIndModsmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "BankIndModlarge.pcx" },
		},
		modern = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "BankIndModsmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "BankIndModlarge.pcx" },
		},
	},
	civil_defense = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "civil defense_small.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "civil defense_large.pcx" },
	},
	coal_plant = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "coalplantsmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "coalplantlarge.pcx" },
	},
	coastal_fortress = {
		american = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "coastalfortressamrsmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "coastalfortressamrlarge.pcx" },
		},
		european = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "coastalfortresseursmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "coastalfortresseurlarge.pcx" },
		},
		mediterranean = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "coastalfortressromsmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "coastalfortressromlarge.pcx" },
		},
		midEastern = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "coastalfortressmeasmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "coastalfortressmealarge.pcx" },
		},
		asian = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "coastalfortressfeasmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "coastalfortressfealarge.pcx" },
		},
	},
	cathedral = {
		american = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "CathedralEursmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "CathedralEurlarge.pcx" },
		},
		european = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "CathedralEursmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "CathedralEurlarge.pcx" },
		},
		mediterranean = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "CathedralEursmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "CathedralEurlarge.pcx" },
		},
		midEastern = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "CathedralMEAsmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "CathedralMEAlarge.pcx" },
		},
		asian = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "CathedralFEAsmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "CathedralFEAlarge.pcx" },
		},
	},
	colosseum = {
		ancient = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "ColosseumAncRensmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "ColosseumAncRenlarge.pcx" },
		},
		middle = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "ColosseumAncRensmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "ColosseumAncRenlarge.pcx" },
		},
		industrial = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "ColosseumIndModsmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "ColosseumIndModlarge.pcx" },
		},
		modern = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "ColosseumIndModsmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "ColosseumIndModlarge.pcx" },
		},
	},
	commercial_dock = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "comm dock_small.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "comm dock_large.pcx" },
	},
	copernicus_observatory = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "solarsystemsmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "solarsystemlarge.pcx" },
	},
	courthouse = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "courthousesmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "courthouselarge.pcx" },
	},
	cure_for_cancer = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "CureforCancersmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "CureforCancerlarge.pcx" },
	},
	factory = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "factorysmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "factorylarge.pcx" },
	},
	granary = {
		ancient = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "GranaryAncRenIndsmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "GranaryAncRenIndlarge.pcx" },
		},
		middle = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "GranaryAncRenIndsmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "GranaryAncRenIndlarge.pcx" },
		},
		industrial = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "GranaryAncRenIndsmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "GranaryAncRenIndlarge.pcx" },
		},
		modern = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "GranaryModsmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "GranaryModlarge.pcx" },
		},
	},
	harbor = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "harbormodsmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "harbormodlarge.pcx" },
	},
	hoover_dam = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "hooverdamsmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "hooverdamlarge.pcx" },
	},
	hospital = {
		ancient = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "Hospitalindsmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "Hospitalindlarge.pcx" },
		},
		middle = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "Hospitalindsmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "Hospitalindlarge.pcx" },
		},
		industrial = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "Hospitalindsmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "Hospitalindlarge.pcx" },
		},
		modern = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "Hospitalmodsmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "Hospitalmodlarge.pcx" },
		},
	},
	hydro_plant = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "hydroplantsmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "hydroplantlarge.pcx" },
	},
	intelligence_agency = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "IntelligenceCentersmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "IntelligenceCenterlarge.pcx" },
	},
	js_bachs_cathedral = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "GreatCathedralsmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "GreatCathedrallarge.pcx" },
	},
	knights_templar = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "knightstemplarsmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "knightstemplarlarge.pcx" },
	},
	leonardos_workshop = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "inventorworkshopsmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "inventorworkshoplarge.pcx" },
	},
	library = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "Librarysmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "Librarylarge.pcx" },
	},
	longevity = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "Longevitysmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "Longevitylarge.pcx" },
	},
	magellans_voyage = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "Circumnavigationsmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "Circumnavigationlarge.pcx" },
	},
	manufacturing_plant = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "manufacturingplantsmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "manufacturingplantlarge.pcx" },
	},
	marketplace = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "MarketplaceIndModsmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "MarketplaceIndModlarge.pcx" },
	},
	mass_transit_system = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "masstransitsmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "masstransitlarge.pcx" },
	},
	military_academy = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "militaryacademysmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "militaryacademyLarge.pcx" },
	},
	newtons_university = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "UniversityIndsmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "UniversityIndlarge.pcx" },
	},
	nuclear_plant = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "NukePlantsmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "NukePlantlarge.pcx" },
	},
	offshore_platform = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "OffshoreDrillingPlatformsmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "OffshoreDrillingPlatformlarge.pcx" },
	},
	palace = {
		american = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "palaceAMERsmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "palaceAMERlarge.pcx" },
		},
		european = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "palaceEURsmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "palaceEURlarge.pcx" },
		},
		mediterranean = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "palaceROMsmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "palaceROMlarge.pcx" },
		},
		midEastern = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "palaceMEAsmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "palaceMEAlarge.pcx" },
		},
		asian = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "palaceFEAsmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "palaceFEAlarge.pcx" },
		},
	},
	police_station = {
		ancient = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "policestationindsmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "policestationindlarge.pcx" },
		},
		middle = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "policestationindsmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "policestationindlarge.pcx" },
		},
		industrial = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "policestationindsmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "policestationindlarge.pcx" },
		},
		modern = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "policestationmodsmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "policestationmodlarge.pcx" },
		},
	},
	recycling_center = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "RecyclingCentersmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "RecyclingCenterlarge.pcx" },
	},
	research_lab = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "researchlabsmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "researchlablarge.pcx" },
	},
	sam_missile_battery = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "SAMBatteriessmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "SAMBatterieslarge.pcx" },
	},
	secret_police_hq = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "DenOfSpiessmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "DenOfSpieslarge.pcx" },
	},
	seti_program = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "SETIsmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "SETIlarge.pcx" },
	},
	shakespeares_theater = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "GreatPlayhousesmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "GreatPlayhouselarge.pcx" },
	},
	sistine_chapel = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "SistineChapelsmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "SistineChapellarge.pcx" },
	},
	smiths_trading_company = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "tradingcompanysmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "tradingcompanylarge.pcx" },
	},
	solar_plant = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "solarsystemsmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "solarsystemlarge.pcx" },
	},
	ss_cockpit = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "SScockpitsmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "SScockpitlarge.pcx" },
	},
	ss_docking_bay = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "SSdockingbaysmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "SSdockingbaylarge.pcx" },
	},
	ss_engine = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "SSenginesmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "SSenginelarge.pcx" },
	},
	ss_exterior_casing = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "SScasingsmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "SScasinglarge.pcx" },
	},
	ss_fuel_cells = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "SSfuelcellssmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "SSfuelcellslarge.pcx" },
	},
	ss_life_support_system = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "SSlifesupportsmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "SSlifesupportlarge.pcx" },
	},
	ss_planetary_party_lounge = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "SSpartyloungesmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "SSpartyloungelarge.pcx" },
	},
	ss_thrusters = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "SSthrustersmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "SSthrusterlarge.pcx" },
	},
	ss_stasis_chamber = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "SSstasissmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "SSstasislarge.pcx" },
	},
	ss_storage_supply = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "SSstoragesmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "SSstoragelarge.pcx" },
	},
	stock_exchange = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "stock ex_small.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "stock ex_large.pcx" },
	},
	strategic_missile_defense = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "SDIsmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "SDIlarge.pcx" },
	},
	sun_tzus_art_of_war = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "AOWsmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "AOWlarge.pcx" },
	},
	temple = {
		american = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "templeamersmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "templeamerlarge.pcx" },
		},
		european = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "templeeursmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "templeeurlarge.pcx" },
		},
		mediterranean = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "templeromsmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "templeromlarge.pcx" },
		},
		midEastern = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "templemeasmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "templemealarge.pcx" },
		},
		asian = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "templefeasmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "templefealarge.pcx" },
		},
	},
	the_colossus = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "colossussmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "colossuslarge.pcx" },
	},
	the_great_library = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "GreatLibrarysmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "GreatLibrarylarge.pcx" },
	},
	the_great_lighthouse = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "LighthouseatAlexandriasmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "LighthouseatAlexandrialarge.pcx" },
	},
	the_great_wall = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "GreatWallsmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "GreatWalllarge.pcx" },
	},
	the_hanging_gardens = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "HangingGardenssmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "HangingGardenslarge.pcx" },
	},
	the_internet = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "internet_small.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "internet_large.pcx" },
	},
	the_manhattan_project = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "ManhattanProjectsmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "ManhattanProjectlarge.pcx" },
	},
	the_mausoleum_of_mausollos = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "mausoleumsmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "mausoleumlarge.pcx" },
	},
	the_oracle = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "oraclesmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "oraclelarge.pcx" },
	},
	the_pyramids = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "Pyramidsmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "Pyramidlarge.pcx" },
	},
	the_statue_of_zeus = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "zeussmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "zeuslarge.pcx" },
	},
	the_temple_of_artemis = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "artemissmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "artemislarge.pcx" },
	},
	the_united_nations = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "UNsmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "UNlarge.pcx" },
	},
	theory_of_evolution = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "TheoryofEvolutionsmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "TheoryofEvolutionlarge.pcx" },
	},
	universal_suffrage = {
		small = { path = CIVILOPEDIA_BUILDINGS .. "UniversalSuffragesmall.pcx" },
		large = { path = CIVILOPEDIA_BUILDINGS .. "UniversalSuffragelarge.pcx" },
	},
	university = {
		ancient = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "UniversityRensmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "UniversityRenlarge.pcx" },
		},
		middle = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "UniversityRensmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "UniversityRenlarge.pcx" },
		},
		industrial = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "UniversityIndsmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "UniversityIndlarge.pcx" },
		},
		modern = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "UniversityModsmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "UniversityModlarge.pcx" },
		},
	},
	walls = {
		american = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "CityWallsamersmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "CityWallsamerlarge.pcx" },
		},
		european = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "CityWallsEursmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "CityWallsEurlarge.pcx" },
		},
		mediterranean = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "CityWallsromsmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "CityWallsromlarge.pcx" },
		},
		midEastern = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "CityWallsmeasmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "CityWallsmealarge.pcx" },
		},
		asian = {
			small = { path = CIVILOPEDIA_BUILDINGS .. "CityWallsfeasmall.pcx" },
			large = { path = CIVILOPEDIA_BUILDINGS .. "CityWallsfealarge.pcx" },
		},
	},
}
textures.popheads = require "civ3.popheads"
textures.cities = require "civ3.cities"
textures.advisor_heads = require "civ3.advisor_heads"
textures.ui.unit_control = require "civ3.unit_control"
textures.terrain_improvements = require "civ3.terrain_improvements"
textures.civ_colors = require "civ3.civ_colors"
textures.unit_icons = require "civ3.unit_icons"
textures.building_icons = require "civ3.building_icons"
textures.tech_icons = require "civ3.tech_icons"
textures.leader_heads = require "civ3.leader_heads"
textures.borders = require "civ3.borders"

return textures
