init()
{
    level thread InitializeVarsPrecaches();
    level.player_out_of_playable_area_monitor = undefined;     
}
onPlayerSpawned()
{
    if(!isDefined(self.menuThreaded))
        self thread playerSetup();
    if(isDefined(level.player_too_many_weapons_monitor))
        level.player_too_many_weapons_monitor = undefined;
    
}

InitializeVarsPrecaches()
{
    if(isDefined(level.InitializeVarsPrecaches))
        return;
    level.InitializeVarsPrecaches = true;
    level._Weaps = GetArrayKeys(level.zombie_weapons);//Currently Unused, but once I map out the StringTables I plan to use this in the Weapons Menu
    level.menuName = "The Lucy Menu";
    level.menuDeveloper = "MrFawkes1337";
    level.AutoVerify = 0;
    level.lucyVersion = "1.4.8";
    level.MenuStatus = StrTok("None, Verified, VIP, Co-Host, Admin, Host, Developer", ",");
    level._PowerupStrings = StrTok("full_ammo,fire_sale,bonus_points_player,free_perk,nuke,hero_weapon_power,insta_kill,double_points,carpenter,bonfire_sale", ",");
    level._PowerupNames = StrTok("Max Ammo,Fire Sale,Bonus Points,Free Perk,Nuke,Full Power,Insta Kill,Double Points,Carpenter,Bonfire Sale",",");
    level._WeaponCategs = StrTok("Assault Rifles,Submachine Guns,Tactical Rifles,Light Machine Guns,Sniper Rifles,Pistols,Shotguns,Special Weapons,Map Specific Weapons", ",");
    level._WeaponCategs2 = StrTok("Assault Rifles,SMG,Tactical Rifles,LMG,Sniper Rifles,Pistols,Shotguns,Special Weapons,Map Specific Weapons and items", ",");
    level._WeaponCategs3 = StrTok("Upgraded AR,Upgraded SMG,Upgraded TR,Upgraded LMG,Upgraded SR,Upgraded Pistols,Upgraded Shotguns,Upgraded Specials", ",");
    level._AssaultStrings = StrTok("ar_accurate_t8,ar_fastfire_t8,ar_damage_t8,ar_stealth_t8,ar_modular_t8,ar_mg1909_t8,ar_standard_t8,ar_galil_t8,ar_peacekeeper_t8,ar_doublebarrel_t8,ar_an94_t8",",");
    level._AssaultNames = StrTok("ICR-7,Maddox RFB,Rampart 17,Vapr-XKG,KN57,Hitchcock M9,Swat RFT,Grav,Peacekeeper,Echohawk,AN94", ",");
    level._UpgAssaultNames = StrTok("Impertinent Deanimator,Red Fiend Bull,Parapetrifrier,Creeping Haze,Ruined Revenger,Waking Nightmare,Rift Breacher,Gravstone,Writ of Shamash,Fanged Doom,Nightmare Awakened 49",",");
    level._SMGStrings = StrTok("smg_standard_t8,smg_handling_t8,smg_fastfire_t8,smg_capacity_t8,smg_accurate_t8,smg_drum_pistol_t8,smg_fastburst_t8,smg_folding_t8,smg_vmp_t8,smg_minigun_t8,smg_mp40_t8,smg_thompson_t8",",");
    level._SMGNames = StrTok("MX9,Saug 9mm,Spirfire,Cordite,GKS,Escargot,Daemon 3XB,Switchblade X9,VMP,MicroMG 9mm,MP40,M1927",",");
    level._UpgSMGNames = StrTok("Nuevemuertes xx,Stellar 92,Sky Scorcher,Corpsemaker,Ghoul Keepers Subjucator,PieceDerResistance,Excisenin3fold,Unseen VHand,The Dark Impaler,Infernal Mercy,The Afterburner,SpeakEasy",",");
    level._TacticalStrings = StrTok("tr_powersemi_t8,tr_longburst_t8,tr_midburst_t8,tr_flechette_t8,tr_leveraction_t8,tr_damageburst_t8",",");
    level._TacticalNames = StrTok("Auger DMR,Swordfish,ABR 223,S6 Stingray,Essex Model 07,M16",",");
    level._UpgTacticalNames = StrTok("Dead Mans ReefRacker,Astralo-Packy-Cormus,Br-r-rah,Macho Manta VI,Quartermaster's Repeater,Skullpiercer",",");
    level._LMGStrings = StrTok("lmg_heavy_t8,lmg_spray_t8,lmg_standard_t8,lmg_double_t8,lmg_stealth_t8", ",");
    level._LMGNames = StrTok("VKM 750,Hades,Titan,Zweihander,TigerShark", ",");
    level._UpgLMGNames = StrTok("Cackling Kaftar,Acheron Alliterator,Tartarus Veil,Sumarbrander,Smilomegladon", ",");
    level._SniperStrings = StrTok("sniper_fastrechamber_t8,sniper_powerbolt_t8,sniper_powersemi_t8,sniper_quickscope_t8,sniper_mini14_t8,sniper_locus_t8,sniper_damagesemi_t8", ",");
    level._SniperNames = StrTok("Outlaw,Paladin HB50,SDM,Koshka,Vendetta,Locus,Havelina AA50", ",");
    level._UpgSniperNames = StrTok("D3SOL0 Regulator,Righteous Fury,IT-5 LYT,Bakeneko,Cnemias Ablation,Arrythmic Dirge,Savage Razorback",",");
    level._PistolStrings = StrTok("pistol_burst_t8,pistol_revolver_t8,pistol_standard_t8,pistol_topbreak_t8,pistol_fullauto_t8", ",");
    level._PistolNames   = StrTok("RK 7 Garrison,Mozu,Strife,Welling,Kap45", ",");
    level._UpgPistolNames = StrTok("Rapskallion 3D,Belle Of The Ball,Z-Harmony,King & Country,IM-PAK-ED", ",");
    level._ShotgunStrings = StrTok("shotgun_pump_t8,shotgun_semiauto_t8,shotgun_trenchgun_t8,shotgun_fullauto_t8,shotgun_precision_t8", ",");
    level._ShotgunNames   = StrTok("Mog 12,SG12,Trenchgun,Rampage,Argus", ",");
    level._UpgShotgunNames = StrTok("OMG Right Hook,Breccius Rebornus,M9-TKG Home Wrecker,Surgical Havoc,Ancient Harbinger", ",");
    level._SpecialStrings = StrTok("launcher_standard_t8,minigun,special_ballisticknife_t8_dw,special_crossbow_t8", ",");
    level._SpecialNames   = StrTok("Give Hellion Salvo,Give Minigun,Ballistic Knife,Crossbow", ",");
    level._UpgSpecialStrings = StrTok("launcher_standard_t8_upgraded,special_ballisticknife_t8_dw_upgraded,special_crossbow_t8_upgraded", ",");
    level._UpgSpecialNames = StrTok("Zitros Orbital Arbalest,TheKrauss Refibrillator++,Minos Zeal", ",");
    level._BloodWeaps = StrTok("ww_blundergat_t8,ww_blundergat_fire_t8,ww_blundergat_acid_t8,zhield_spectral_dw,spoon_alcatraz,spork_alcatraz,tomahawk_t8",",");
    level._BloodWeapNames = StrTok("Blundergat,Magmagat,AcidGat,Spectral Shield,Spoon,Golden Spork,Hells Retriever",",");
    level._UpgBloodWeaps = StrTok("ray_gun_upgraded,ray_gun_mk2_upgraded,ww_blundergat_fire_t8_upgraded,ww_blundergat_acid_t8_upgraded,ww_bluntergat_t8_upgraded,tomahawk_t8_upgraded,zhield_spectral_dw_upgraded,spknifeork,golden_knife,ww_blundergat_fire_t8_unfinished", ",");
    level._UpgBloodNames = StrTok("Porters X2 Ray Gun,Porters Mark II Ray Gun,Magnus Operandi,Vitriolic Withering,The Sweeper,Hells Redeemer,Attuned Spectral Shield,Golden Spork Knife,Golden Scalpel,Tempered Blundergat", ",");
    level._VoyageWeaps = StrTok("ww_tricannon_t8,ww_tricannon_earth_t8,ww_tricannon_fire_t8,ww_tricannon_water_t8,ww_tricannon_air_t8,zhield_dw",",");
    level._VoyageWeapNames = StrTok("Kraken,Decayed Kraken,Plasmatic Kraken,Purified Kraken,Radiant Kraken,Ballistic Shield",",");
    level._IXWeaps = StrTok("zhield_zword_dw,ww_crossbow_t8",",");
    level._IXWeapNames = StrTok("Brazen Bull,Death of Orion",",");
    level._IXUpgNames = StrTok("Iron Bull,Serket Kiss", ",");
    level._DeadWeaps = StrTok("ww_crossbow_impaler_t8,ww_random_ray_gun1,zhield_dw,stake_knife",",");
    level._DeadUpgWeaps = StrTok("ww_crossbow_t8_upgraded,zhield_zword_dw_upgraded", ",");
    level._DeadUpgNames = StrTok("Chaos Theory,Alistairs Annihilator", ",");
    level._DeadWeapNames = StrTok("Savage Impaler,Alistairs Folly,Ballistic Shield,Stake Knife",",");
    level._AEWeaps = StrTok("ww_hand_o,ww_hand_h,ww_hand_g,ww_hand_c,zhield_zpear_dw,Thunderstorm",",");
    level._AEWeapNames = StrTok("Hand of Ouranous,Hand of Hemera,Hand of Gaia,Hand of Charon,Apollo Will Shield,Pegasus Strike",",");
    level._TagWeaps = StrTok("thundergun,ww_tesla_gun_t8,ww_tesla_sniper_t8,tundragun,snowball,snowball_yellow,music_box,zhield_dw,eq_nesting_doll_grenade",",");
    level._TagWeapNames = StrTok("Thundergun,Wonderwaffe DG2,Wonderwaffe Sniper,Tundragun,Snowballs,Yellow Snowballs,Samantha Box,Ballistic Shield,Matryoska Dolls",",");
    level._UpgTagWeapNames = StrTok("Zeuscannon,Wonderwaffe DG-3 JZ,Boreas Blizzard,Wunderwaffe DG-Funkenschutze,snowball,snowball_yellow", ",");
    level._AOWeaps = StrTok("ray_gun_mk2v,ray_gun_mk2x,ray_gun_mk2y,ray_gun_mk2z,zhield_dw",",");
    level._UpgAOWeaps = StrTok("ray_gun_mk2v_upgraded,ray_gun_mk2x_dw,ray_gun_mk2y_upgraded,ray_gun_mk2z_upgraded,zhield_dw",",");
    level._AOWeapNames = StrTok("Ray Gun II-V,Ray Gun II-X,Ray Gun II-Y,Ray Gun II-Z,Ballistic Shield",",");
    level._ClassWeaps = StrTok("ww_Freezegun_t8,zhield_dw",",");
    level._ClassWeapNames = StrTok("Winters Howl,Ballistic Shield",",");
    level._UpgClassWeaps = StrTok("ww_Freezegun_t8,zhield_dw,ray_gun,ray_gun_mk2",",");
    level._MapWeapsAether = StrTok("ray_gun,cymbal_monkey,ray_gun_mk2",",");
    level._MapWeapsAetherNames   = StrTok("Ray Gun,Monkey Bombs,Ray Gun Mk2", ",");
    level._MegaElixirs = StrTok("shopping_free,head_drama,secret_shopper,reign_drops,power_vacuum,near_death_experience,phoenix_up,conflagration_liquidation,join_the_party,perkaholic,refresh_mint,suit_up,wall_power",",");
    level._MegaTypes  = StrTok("2,2,2,2,2,2,1,1,1,1,1,1,2",",");
    level._LegendaryElixirs = StrTok("cache_back,dividend_yield,free_fire,perk_up,power_keg,wall_to_wall_clearance,undead_man_walking",",");
    level._LegendaryTypes = StrTok("1,2,2,1,1,2,2",",");
    level._RareElixirs = StrTok("alchemical_antithesis,blood_debt,extra_credit,immolation_liquidation,kill_joy,shields_up,talkin_bout_regeneration",",");
    level._RareTypes = StrTok("2,2,1,1,1,1,2",",");
    level._CommonElixirs = StrTok("bullet_boost,ctrl_z,dead_of_nuclear_winter,in_plain_sight,licensed_contractor,phantom_reload,sword_flay,whos_keeping_score",",");
    level._CommonTypes = StrTok("1,2,1,2,1,2,2,1",",");
    level._ClassicElixirs = StrTok("always_done_swiftly,anywhere_but_here,burned_out,equip_mint,head_scan,temporal_gift,aftertaste,point_drops,anti_entrapment,nowhere_but_there,now_you_see_me,arsenal_accelerator,pop_shocks,stock_option,newtonian_negation,quacknarok",",");
    level._ClassicTypes = StrTok("2,1,2,1,2,2,2,1,2,1,2,2,2,2,2,2",",");
    level._StatOpts = StrTok("Total Games Played,Highest Round,Most Kills,Most Headshots,Round",",");
    level._PerkStrings = StrTok("specialty_cooldown,specialty_quickrevive,specialty_awareness,specialty_staminup,specialty_etherealrazor,specialty_wolf_protector,specialty_zombshell,specialty_death_dash,specialty_electriccherry,specialty_berserker,specialty_camper,specialty_shield,specialty_deadshot,specialty_extraammo,specialty_widowswine,specialty_additionalprimaryweapon,specialty_phdflopper,specialty_mystery", ",");
    level._PerkNames = StrTok("Timeslip,Quick Revive,Death Perception,Stamin-Up,Ethereal Razor,Blood Wolf Bite,Zombshell,Blaze Phase,Electric Cherry,Dying Wish,Stone Cold Stronghold,Victorious Tortoise,Deadshot Dealer,Bandolier Bandit,Winter's Wail,Mule Kick,PhD Slider,Secret Sauce", ",");
}

playerSetup()
{
    if(isDefined(self.menuThreaded))
        return;
    
    self defineVariables();
    if(!self IsHost())
    {
        if(!isDefined(self.playerSetting["verification"]))
            self.playerSetting["verification"] = level.MenuStatus[level.AutoVerify];
    }
    else
        self.playerSetting["verification"] = level.MenuStatus[(level.MenuStatus.size - 2)];
    
    if(self hasMenu())
    {
        wait 5;
        self iPrintln("^9Welcome To " + level.menuName + ", Version: " + level.lucyVersion);
        self iPrintLn("^1Developed By: ^2" + level.menuDeveloper);
        self iPrintln("^0Verification Status: " + self.playerSetting["verification"]);
    }
    self thread menuMonitor();
    self.menuThreaded = true;
}

replaceChar(string, substring, replace)
{
    final = "";
    for(e=0;e<string.size;e++)
    {
        if(string[e] == substring)
            final += replace;
        else 
            final += string[e];
    }
    return final;
}

constructString(string)
{
    final = "";
    for(e=0;e<string.size;e++)
    {
        if(e == 0)
            final += toUpper(string[e]);
        else if(string[e-1] == " ")
            final += toUpper(string[e]);
        else 
            final += string[e];
    }
    return final;
}
defineVariables()
{
    if(isDefined(self.DefinedVariables))
        return;
    self.DefinedVariables = true;
    
    if(!isDefined(self.menu))
        self.menu = [];
    if(!isDefined(self.playerSetting))
        self.playerSetting = [];
    if(!isDefined(self.menu["curs"]))
        self.menu["curs"] = [];
    
    self.playerSetting["isInMenu"] = undefined;
    self.menu["currentMenu"] = "Main";
    self.menu["curs"][self.menu["currentMenu"]] = 0;
}