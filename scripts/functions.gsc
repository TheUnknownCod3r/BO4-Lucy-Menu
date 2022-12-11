Godmode()
{
    self.godmode = isDefined(self.godmode) ? undefined : true;
 
    if(isDefined(self.godmode))
    {
        self endon("disconnect");
 
        while(isDefined(self.godmode)) 
        {
            self EnableInvulnerability();
            wait 0.1;
        }
    }
    else
        self DisableInvulnerability();
}

UnlimitedAmmo()
{
    self.UnlimitedAmmo = isDefined(self.UnlimitedAmmo) ? undefined : true;
    if(isDefined(self.UnlimitedAmmo))
    {
        while(isDefined(self.UnlimitedAmmo))
        {
            self GiveMaxAmmo(self GetCurrentWeapon());
            self SetWeaponAmmoClip(self GetCurrentWeapon(), self GetCurrentWeapon().clipsize);
            wait .05;
        }
    }
}
BO4GiveBG()
{
    self giveWeapon(getweapon(#"hash_19c157f2230454ad"));
    self switchToWeapon(getweapon(#"hash_19c157f2230454ad"));
}

DoWWDotn1()
{
    self GiveWeapon(getWeapon(#"hash_25f355b5d35b8488"));
    self switchToWeapon(getWeapon(#"hash_25f355b5d35b8488"));
}

GiveKraken()
{//hash_5b8d1ff4b772bd85
    self giveWeapon(getWeapon(#"hash_5b8d1ff4b772bd85"));
    self switchToWeapon(getWeapon(#"hash_5b8d1ff4b772bd85"));
}
DoWWDotn2()
{
    self GiveWeapon(GetWeapon(#"hash_138efe2bb30be63c"));
    self switchToWeapon(GetWeapon(#"hash_138efe2bb30be63c"));
}
BO4GiveSpoon()
{
    self giveWeapon(getWeapon(#"hash_52b03a79f854eed3"));
    self switchToWeapon(getWeapon(#"hash_52b03a79f854eed3"));
}
//freezegun? hash_2605a6745df58840

//Spectral Shield hash_185abc5c82e9d849
BO4GiveSpork()
{
    self giveWeapon(getWeapon(#"hash_32a584f5a65c70d1"));
    self switchToWeapon(getWeapon(#"hash_32a584f5a65c70d1"));
}
BO4GiveAG()
{
    self giveWeapon(getweapon(#"hash_25a13b6f6232a985"));
    self switchToWeapon(getweapon(#"hash_25a13b6f6232a985"));
}
BO4GiveMG()
{
    self giveWeapon(getweapon(#"hash_1b5092cccdb3d65b"));
    self switchToWeapon(getweapon(#"hash_1b5092cccdb3d65b"));
}
BO4GiveWeapon(weap)
{
    weapon = getweapon(weap);
    self giveWeapon(weapon);
    wait .1;
    self giveMaxAmmo(weapon);
    wait .1;
    self switchToWeapon(weapon);
}
Clone()
{
    self util::spawn_player_clone(self);
}

RestartMap()
{
    map_restart(0);
}

StringSliderTest(string)
{
    self iPrintlnBold(string);
}

IntSliderTest(int)
{
    self iPrintlnBold(int);
}

PlayerGiveScore(value, player)
{
    player zm_score::add_to_player_score(value);
}

PlayerTakeScore(value, player)
{
    player zm_score::minus_to_player_score(value);
}

Achievements(player)
{
    Gillam_Achi = array("zm_office_cold_war", "zm_office_ice", "zm_office_shock", "zm_office_power", "zm_office_strike", "zm_office_office", "zm_office_crawl", "zm_office_gas", "zm_office_pentupagon", "zm_office_everywhere", "zm_red_tragedy","zm_red_follower","zm_red_tribute","zm_red_mountains","zm_red_no_obol","zm_red_sun","zm_red_wind","zm_red_eagle","zm_red_defense","zm_red_gods", "zm_white_shard","zm_white_starting","zm_white_unlock","zm_white_mod","zm_white_trap","zm_white_pap","zm_white_knuckles","zm_white_perk","zm_white_stun","zm_white_roof","zm_trophy_doctor_is_in", "zm_trials_round_30","zm_escape_most_escape","zm_escape_patch_up","zm_escape_hot_stuff","zm_escape_hist_reenact","zm_escape_match_made","zm_escape_west_side","zm_escape_senseless","zm_escape_gat","zm_escape_throw_dog", "zm_orange_ascend","zm_orange_bells","zm_orange_freeze","zm_orange_hounds","zm_orange_totems","zm_orange_pack","zm_orange_secret","zm_orange_power","zm_orange_ziplines","zm_orange_jar","ZM_ZODT8_TRIAL_STEP_1", "ZM_MANSION_ARTIFACT","ZM_MANSION_STAKE","ZM_MANSION_BOARD","ZM_MANSION_BITE","ZM_MANSION_QUICK","ZM_MANSION_ALCHEMICAL","ZM_MANSION_CRAFTING","ZM_MANSION_SHOCKING","ZM_MANSION_CLOCK","ZM_MANSION_SHRINKING", "zm_towers_challenges","zm_towers_get_ww","zm_towers_trap_build","zm_towers_ww_kills","zm_towers_kitty_kitty","zm_towers_dismember","zm_towers_boss_kill","zm_towers_arena_survive","zm_towers_fast_pap", "ZM_ZODT8_ARTIFACT","ZM_ZODT8_STOWAWAY","ZM_ZODT8_DEEP_END","ZM_ZODT8_LITTLE_PACK","ZM_ZODT8_SHORTCUT","ZM_ZODT8_TENTACLE","ZM_ZODT8_STOKING","ZM_ZODT8_ROCK_PAPER","ZM_ZODT8_SWIMMING","zm_trophy_jack_of_all_blades", "zm_trophy_straw_purchase","zm_trophy_perkaholic_relapse","zm_trophy_gold","zm_rush_personal_score","zm_rush_team_score","zm_rush_multiplier_100","mp_trophy_special_issue_weaponry","mp_trophy_special_issue_equipment", "wz_specialist_super_fan","wz_first_win","wz_not_a_fluke","wz_blackout_historian","wz_specialist_super_fan","wz_zombie_fanatic","mp_trophy_battle_tested","mp_trophy_welcome_to_the_club","MP_SPECIALIST_MEDALS","MP_MULTI_KILL_MEDALS", "mp_trophy_vanquisher");

    foreach(Achev in Gillam_Achi) 
    {
        player GiveAchievement(Achev);
        player iPrintLnBold("^2" + Achev);
        wait .5;
    }
    wait .5;
    player iPrintLnBold("^6All Achievements Unlocked");
}

CompleteActiveContracts(player)
{
    foreach(index, contract in player.pers["contracts"])
    {
        contractValue = contract.target_value;
        if(isDefined(contractValue) && contractValue)
            contract.current_value = contractValue;
    }
}

thirdperson()
{
    self.thirdperson = isDefined(self.thirdperson) ? undefined : true;
    if (isDefined(self.thirdperson))
        self setclientthirdperson(1);
    else
        self setclientthirdperson(0);
}

UnlimitedSprint() 
{
    self.UnlimitedSprint = isDefined(self.UnlimitedSprint) ? undefined : true;
    if (isDefined(self.UnlimitedSprint))
    {
        self setperk("specialty_unlimitedsprint");
        self iPrintLnBold("Unlimited Sprint ^2Enabled");
    } 
    else 
    {
        self unsetperk("specialty_unlimitedsprint");
        self iPrintLnBold("Unlimited Sprint ^1Disabled");
    }
}    
        
notarget()
{
    self.NoTarg = isDefined(self.NoTarg) ? undefined : true;
    if (isDefined(self.NoTarg))
        self.ignoreme++;
    else
        self.ignoreme--;
}

ProMod()
{
    self.promod = isDefined(self.promod) ? undefined : true;
    if (isDefined(self.promod))
        setdvar(#"cg_fov", 120);
    else
        setdvar(#"cg_fov", 80);
}

GiveWeapon()
{
    weapon = getweapon("shotgun_trenchgun_t8");
    self giveweapon(weapon);
    self switchtoweapon(weapon);
}

UpgradeWeapon()
{
    weapon = self GetCurrentWeapon();
    self TakeWeapon(weapon);
    wait .1;
    self GiveWeapon(self zm_weapons::get_upgrade_weapon(weapon, zm_weapons::weapon_supports_aat(weapon)));
    self SwitchToWeapon(self zm_weapons::get_upgrade_weapon(weapon, zm_weapons::weapon_supports_aat(weapon)));
    self IPrintLnBold("^2Your current weapon has been upgraded!");
}

StartTeleGun()
{
    self.TeleGun = isDefined(self.TeleGun) ? undefined : true;
    if (isDefined(self.TeleGun))
    {
        self thread TeleportToCrosshair();
    } 
    else 
    {
        self notify("stop_telegun");
    }
}

TeleportToCrosshair() 
{
    self endon("stop_telegun");
    self endon("game_ended");
    for (;;) 
    {
        self waittill("weapon_fired");
        self SetOrigin(bullettrace(self GetTagOrigin("tag_weapon"), self GetTagOrigin("tag_weapon") + vector_scal(AnglesToForward(self GetPlayerAngles()), 10000), 1, self)["position"]);
        wait .1;
    }
    wait .1;
}

vector_scal(vec, scale) 
{
    vec = (vec[0] * scale, vec[1] * scale, vec[2] * scale);
    return vec;
} 

HideGun() 
{
    self.HideWeapon = isDefined(self.HideWeapon) ? undefined : true;
    if (isDefined(self.HideWeapon))
    {
        setDvar("cg_drawGun", 0);
    } 
    else 
    {
        setDvar("cg_drawGun", 1);
    }
}

bo4_GivePerk(Perk_Name, string) 
{
    self zm_perks::vending_trigger_post_think(self, Perk_Name);
    self iPrintLnBold(Perk_Name + " ^2Given!");
}

KillAllZombies(player) 
{
    foreach(zombie in GetAITeamArray(level.zombie_team)) 
    {
        if (isDefined(zombie)) zombie dodamage(zombie.maxhealth + 999, zombie.origin, player);
    }
}

TeleportZombies() 
{
    foreach(zombie in GetAITeamArray(level.zombie_team)) 
    {
        if (isDefined(zombie)) zombie ForceTeleport(self.origin + (+40, 0, 0));
    }
    self iPrintLnBold("Zombies Teleported!");
}

StartZombiePosistion() 
{
    self.ZombiePos = isDefined(self.ZombiePos) ? undefined : true;
    if (isDefined(self.ZombiePos))
    {
        self thread SetZombiePosition();
    } 
    else 
    {
        self notify("stop_zombiepos");
    }
}

SetZombiePosition() 
{
    self endon("stop_zombiepos");
    self endon("game_ended");
    for (;;)
    {
        foreach(zombo in GetAITeamArray(level.zombie_team)) 
        {
            zombo ForceTeleport(self.origin + (+70, 0, 0));
        }
        wait .1;
    }
    wait .1;
}

BoxPrice(value)
{
    foreach(chest in level.chests) chest.zombie_cost = value;

}

AntiQuit(player) 
{

    self.AntiQuit = isDefined(self.AntiQuit) ? undefined : true;
    if(isDefined(self.AntiQuit))
    {
        SetMatchFlag("disableIngameMenu", 1);
        self iPrintLnBold("Anti Quit ^2Enabled");
        foreach(player in level.players) 
        {
            player CloseInGameMenu();
        }
    } 
    else 
    {
        SetMatchFlag("disableIngameMenu", 0);
        self iPrintLnBold("Anti Quit ^1Disabled");
    }
}

DropWeapon()
{
    Current_Weapon = self GetCurrentWeapon();
    self DropItem(Current_Weapon);
    self iPrintLnBold("^2Current Weapon Dropped");
}

TakeWeapons()
{
    weapon = self getCurrentWeapon();
    self TakeAllWeapons();
    wait .5;
    self TakeWeapon(weapon);
}

TakeCurrentWeapon()
{
    weapon = self getCurrentWeapon();
    self TakeWeapon(weapon);
    wait .5;
    self TakeWeapon(weapon);
}


KillPlayer(player)
{
    player notify("player_suicide");
    player zm_laststand::bleed_out();
    self iPrintLnBold("Killed "+player.name);
    player iPrintLnBold("You Just got murdered By: "+self.name);
}
TakeAllPlayerWeaps(player)
{
    player takeAllWeapons();
    player iPrintLnBold("You just had your Weapons Taken!");
}

sendToJail(player)
{
    if(!isDefined(level.JailCoords))
        self S("Jail Coords are Not Defined for the Map");
    
    player setOrigin(level.JailCoords);
    player S("You were sent to JAIL!");
}
BO4Level55(player)
{
    player AddRankXpValue("kill", 25160000);
    player rank::updaterank();
    wait .1;
    uploadStats(player);
    player iPrintLnBold("^2In order for the rank to save, please end the game via the pause menu and not the fast end!!!");
}


BO4GetPrestige()
{
	prestigeVal = self stats::get_stat("playerstatslist", "plevel", "statvalue");
	self iPrintLnBold("Your Prestige is: "+prestigeVal);
}

BO4GetLevel()
{
    levelVal = self stats::get_stat("playerstatslist", "rank", "statvalue");
    self iPrintLnBold(levelVal);
}
BO4SetPrestigeMax()
{
    currentPrestige = self stats::get_stat("playerstatslist", "plevel", "statvalue");
    if(currentPrestige == 11){
    self stats::set_stat("playerstatslist", "plevel", "statvalue", 11);
    self stats::set_stat("playerstatslist", "paragon_rank", "statvalue", 999);
    self stats::set_stat("playerstatslist", "paragon_rankxp", "statvalue", 251600000);
    self addRankXpValue("kill", 251600000);
    self rank::updaterank();
    wait .1;
    uploadStats(self);
    self S("This should set you to master 1000");
    }
    else{
        self stats::set_stat("playerstatslist", "plevel", "statvalue", 10);
        self AddRankXpValue("kill", 25160000);
        self rank::updaterank();
        wait .1;
        uploadStats(self);
    }
}


ClientPrestige(Val, player)
{
    player thread BO4SetPrestige(Val);
}
BO4SetPrestige(val)
{
    self stats::set_stat("playerstatslist","plevel", "statValue", val);
    self rank::updaterank();
    uploadStats(self);
    self S("Your Prestige Was Set To: "+val);
}
PlasmaLoopplayer(player)
{
    player.PlasmaLoop = isDefined(player.PlasmaLoop) ? undefined : true;
    if(isDefined(player.PlasmaLoop))
    {
        while(isDefined(player.PlasmaLoop))
        {
            player function_e8f77739(#"zm_timeplayed", 1000000);
            wait .1;
        }
    }
}

PlayerMessage(val, player)
{
    foreach(client in level.players)
    {
        if(val == 0){ client S(player.name+" Has a Mod Menu!");}
        else if(val == 1){ client S(player.name+" Is Cheating!!");}
        else if(val == 2){ client S(player.name+" is a Hacking Bitch!");}
        else if(val == 3){ client S(player.name+" Is a terrible Zombies Player!");}
        else if(val == 4){ client S(player.name+" Has a Tiny Pee Pee");}
    }
}
PlasmaLoop()
{
    self.PlasmaLoop2 = isDefined(self.PlasmaLoop2) ? undefined : true;
    if(!isDefined(self.PlasmaGiven)) self.PlasmaGiven = 0;
    if(isDefined(self.PlasmaLoop2)){
        while(isDefined(self.PlasmaLoop2))
        {
            self function_e8f77739(#"zm_timeplayed", 1000000);
            self.PlasmaGiven += 1000000;
            self iPrintLnBold("You Just Got 100k Plasma. Total: "+self.PlasmaGiven);
            wait 1;
        }
    }
}
bo4_MaxLevels(player)
{
    player endon("disconnect");
    self iPrintLnBold("^2Maxing Out Weapon Levels!");

    foreach(gun in level.zombie_weapons)
    {
        player stats::set_stat(#"hash_60e21f66eb3a1f18", gun.weapon.name, #"xp", 665535);
        player stats::set_stat(#"hash_60e21f66eb3a1f18", gun.weapon.name, #"plevel", 2);
        
        wait 0.01;
    }

    Attachments = Array(#"reflex", #"elo", #"acog", #"dualoptic", #"mms", #"holo");
    foreach(attachment in Attachments)
    {
        player stats::set_stat(#"hash_2ea32bf38705dfdc", attachment, #"kills", #"StatValue", 5000);
        player stats::set_stat(#"hash_2ea32bf38705dfdc", attachment, #"kills", #"ChallengeValue", 5000);

        wait 0.01;
    }

    wait 0.1;
    UploadStats(player);
    player iPrintlnBold("Max Weapon Ranks ^2Set");
}

bo4_UnlockAll(player)
{
    if(isDefined(player.UnlockAll))
        return;
    player.UnlockAll = true;
 
    player endon("disconnect");
 
    player iPrintlnBold("Unlock All ^2Started");
    if(player != self)
        self iPrintlnBold(player getName() + ": Unlock All ^2Started");
 
    for(a=1;a<6;a++)
    {
        if(a == 4) //statsmilestones4.csv is an empty table. So we skip it
            a++;
        
        switch(a)
        {
            case 1:
                start = 1;
                end = 292;
                break;
            case 2:
                start = 292;
                end = 548;
                break;
            case 3:
                start = 548;
                end = 589;
                break;
            case 5:
                start = 1024;
                end = 1412;
                break;
            default:
                start = 0;
                end = 0;
                break;
        }
        
        for(value=start;value<end;value++)
        {
            stat         = SpawnStruct();
            stat.value   = Int(TableLookup("gamedata/stats/zm/statsmilestones" + a + ".csv", 0, value, 2));
            stat.type    = TableLookup("gamedata/stats/zm/statsmilestones" + a + ".csv", 0, value, 3);
            stat.name    = TableLookup("gamedata/stats/zm/statsmilestones" + a + ".csv", 0, value, 4);
 
            switch(stat.type)
            {
                case "global":
                    player stats::set_stat(#"PlayerStatsList", stat.name, #"StatValue", stat.value);
                    player stats::set_stat(#"PlayerStatsList", stat.name, #"Challengevalue", stat.value);
                    break;
                case "attachment":
                    break; //Without column 13 on the tables, it's pretty useless. So we skip the attachment challenges.
                case "group":
                    groups = Array(#"weapon_pistol", #"weapon_smg", #"weapon_assault", #"weapon_lmg", #"weapon_cqb", #"weapon_sniper", #"weapon_tactical", #"weapon_launcher", #"weapon_cqb", #"weapon_knife", #"weapon_special");
                    foreach(group in groups)
                    {
                        player stats::set_stat(#"GroupStats", group, #"stats", stat.name, #"StatValue", stat.value);
                        player stats::set_stat(#"GroupStats", group, #"stats", stat.name, #"Challengevalue", stat.value);
 
                        wait 0.01;
                    }
                    break;
                default:
                    foreach(weap in level.zombie_weapons)
                        if(isDefined(weap.weapon) && zm_utility::getweaponclasszm(weap.weapon) == stat.type)
                        {
                            player AddWeaponStat(weap.weapon, stat.name, stat.value);
                            wait 0.01;
                        }
                    break;
            }
            wait 0.1;
            UploadStats(player);
        }
    }
 
    player iPrintlnBold("Unlock All Challenges ^2Done");
    if(player != self)
        self iPrintlnBold(player getName() + ": Unlock All Challenges ^2Done");
}

bo4_toggleaimbot()
{
    self.aimbot = isDefined(self.aimbot) ? undefined : true;
    if (isDefined(self.aimbot))
    {
        self thread bo4_AimBot();
        self iPrintLnBold("Aimbot ^2Enabled");
    } 
    else 
    {
        self notify("StopAimbotting");
        self iPrintLnBold("Aimbot ^1Disabled");
    }
}

bo4_AimBot()
{
    self endon("disconnect");
    self endon("StopAimbotting");
    while(isDefined(self.aimbot))
    {
        ClosestZombie = Array::get_all_closest(self.origin, GetAITeamArray(level.zombie_team));
        
        if(self isFiring() && ClosestZombie.size > 0 && isAlive(ClosestZombie[0]) && !self IsMeleeing())
        {
            Loc = ClosestZombie[0] gettagorigin("tag_origin");
            
            self setplayerangles(VectorToAngles((Loc) - (self gettagorigin("tag_origin"))));
            wait .05;
            ClosestZombie[0] kill();
        }
        wait .05;
    }
}

ShowAllBoxes()
{
    foreach(chest in level.chests)
	{
		chest zm_magicbox::show_chest();
	}
}

ModelSpawnTest()
{
        Jugg = util::spawn_model("p7_zm_vending_widows_wine", self.origin + (20, 20, 0));
        wait 2;
        Jugg SetScale(100);
}

LunaWolf()
{
    spawnactor(#"hash_3f174b9bcc408705", self.origin, self.angles, "wolf_protector", 1);
}

RoundEdit(value)//Renamed cause round999 wasn't really a good name for it now its on a slider.
{
    namespace_a28acff3::set_round_number(value);
    self thread KillAllZombies();
}

Stats_TotalPlayed(score)
{
    self zm_stats::function_ab006044("TOTAL_GAMES_PLAYED", score);
}

Stats_HighestReached(score)
{
    self zm_stats::function_1b763e4("HIGHEST_ROUND_REACHED", score);
}

Stats_MostKills(score)
{
    self zm_stats::function_1b763e4("kills", score);
}

Stats_MostHeadshots(score)
{
    self zm_stats::function_1b763e4("MOST_HEADSHOTS", score);
}

Stats_Round(score)
{
    self zm_stats::function_ab006044("TOTAL_ROUNDS_SURVIVED", score);
    self zm_stats::function_a6efb963("TOTAL_ROUNDS_SURVIVED", score);
    self zm_stats::function_9288c79b("TOTAL_ROUNDS_SURVIVED", score);
}

bo4_AddBotsToGame() 
{
    AddTestClient();
}

BO4_OpenAllDoors()
{
	setdvar(#"zombie_unlock_all", 1);
	level flag::set("power_on");
	level clientfield::set("zombie_power_on", 1);
	power_trigs = getentarray("use_elec_switch", "targetname");
	foreach(trig in power_trigs)
	{
		if(isdefined(trig.script_int))
		{
			level flag::set("power_on" + trig.script_int);
			level clientfield::set("zombie_power_on", trig.script_int + 1);
		}
	}
	players = getplayers();
	zombie_doors = getentarray("zombie_door", "targetname");
	for(i = 0; i < zombie_doors.size; i++)
	{
		if(!(isdefined(zombie_doors[i].has_been_opened) && zombie_doors[i].has_been_opened))
		{
			zombie_doors[i] notify(#"trigger", {#activator:players[0]});
		}
		if(isdefined(zombie_doors[i].power_door_ignore_flag_wait) && zombie_doors[i].power_door_ignore_flag_wait)
		{
			zombie_doors[i] notify(#"power_on");
		}
		waitframe(1);
	}
	zombie_airlock_doors = getentarray("zombie_airlock_buy", "targetname");
	for(i = 0; i < zombie_airlock_doors.size; i++)
	{
		zombie_airlock_doors[i] notify(#"trigger", {#activator:players[0]});
		waitframe(1);
	}
	zombie_debris = getentarray("zombie_debris", "targetname");
	for(i = 0; i < zombie_debris.size; i++)
	{
		if(isdefined(zombie_debris[i]))
		{
			zombie_debris[i] notify(#"trigger", {#activator:players[0]});
		}
		waitframe(1);
	}
	level notify(#"open_sesame");
	wait(1);
	setdvar(#"zombie_unlock_all", 0);
    self iPrintLnBold("Doors ^2Opened");
}


//Start Changes
test()
{
    self iPrintLnBold("Test");
}

TeleTo(arg, player)
{
    if(arg == "them"){
        self setOrigin(player.origin + (+30, 0, 0));
    }else if(arg == "me"){
        player setOrigin(self.origin + (30, 0, 0));
    }
}
FloatingZombies()
{
    if(!isDefined(self.FloatingZombies))
    {
        self.FloatingZombies = true;
        setDvar("phys_gravity", 100);
        self iPrintLnBold("Newtonian Negation ^2Enabled");
    }
    else 
    {
        self.FloatingZombies = undefined;
        setDvar("phys_gravity", 800);
        self iPrintLnBold("Newtonian Negation ^1Disabled");
    }
}

ClientFuncs(args, val1)
{
    foreach(player in level.players)
    {
        if (args == "GodMode")
        {
            player thread Godmode();
        }
        else if(args == "Ammo")
        {
            player thread UnlimitedAmmo();
        }
        else if (args == "Points")
        {
            player thread zm_score::add_to_player_score(40000000);
        }
        else if(args == "Perks")
        {
            player thread GiveAllPerks();
        }
    }
}

ClientHandler(func, player)
{
    if(func == "GodMode"){
        player thread Godmode();
    }else if(func == "Ammo"){
        player thread UnlimitedAmmo();
    }else if(func == "MaxLevel"){
        player thread BO4Level55(player);
    }else if(func == "Plasma"){
        player thread PlasmaLoop();
    }else if(func == "BG"){
        player thread BO4GiveBG();
    }else if(func == "MG"){
        player thread BO4GiveMG();
    }else if(func == "AG"){
        player thread BO4GiveAG();
    }else if(func == "Perks"){
        player thread GiveAllPerks();
    }else if(func == "Score"){
        player thread zm_score::add_to_player_score(40000000);
    }else if(func == "SelfRev"){
        player thread GetSelfRes();
    }else if(func == "UnlockAll"){
        player thread BO4_UnlockAll(player);
    }else if(func == "WeaponLevels"){
        player thread BO4_MaxLevels(player);
    }else if(func == "1000"){
        player thread BO4SetPrestigeMax();
    }else if(func == "TakePoints"){
        player zm_score::minus_to_player_score(40000000);
    }
}
S(Message)
{
    self iPrintLnBold(Message);
}

GetSelfRes()
{
    self zm_laststand::function_3a00302e();//Awards One Self Revive at a time.
    self S("Self Revive ^1Awarded");
}
BO4GiveElixir(name) //works for some, not all
{
    self thread bgb::function_b7ba7d51(name);//Actually gives instant use elixir like Perkaholic etc, Doesnt work for timed Elixirs.
    self thread bgb::give(name);//gives popup for the Elixir on screen, should work for all
}
SetSelfRevives(count)
{
    foreach(player in level.players){
        player zm_laststand::function_3d685b5f(count);
        player S("Awarded "+count+" Self Revives");
    }
}

GiveElixir2(name)
{
    self thread bgb::function_62f40b0d(name);//Gives Timed Elixir, Doesnt work for Single Use Elixirs.
    self thread bgb::give(name);//Just for elixir popup
}
RemoveEff(weapon)
{
    //self TakeWeapon(weapon);
    //wait 0.1;
    //self GiveWeapon(weapon);
    self thread aat::remove(weapon);
    wait .5;
    self switchToWeapon(weapon);
    self S("Removed Effect");
}

BO4OriginPrint()
{
    current_origin = self.origin;
    self S("Coords: "+current_origin);
}

DownPlayer(player)
{
    player disableInvulnerability();
    player doDamage(player.health + 1, player.origin);
    self iPrintLnBold("Player ^1Downed");
    player iPrintLnBold("You Were Downed by "+self.name);
}
BO4GetMap()
{
    if(level.script == "zm_towers") return "IX";//
    else if(level.script == "zm_escape") return "Blood";//
    else if(level.script == "zm_red") return "AE";//
    else if(level.script == "zm_white") return "AO";//
    else if(level.script == "zm_mansion") return "Dead";//
    else if(level.script == "zm_orange") return "Tag";
    else if(level.script == "zm_office") return "Classified";//
    else if(level.script == "zm_zodt8") return "Voyage";//
}
GiveDOO()
{
    self GiveWeapon(getweapon(#"hash_4ae11871b1233211"));
    self switchToWeapon(getweapon(#"hash_4ae11871b1233211"));
}
PlayEESong()
{
    level thread zm_audio::sndmusicsystem_stopandflush();
	waitframe(1);
	level thread zm_audio::sndmusicsystem_playstate("ee_song");
}
ChangeMap(Mapname)
{
    self iPrintLnBold("Map Changing To "+Mapname);
    wait 0.5;
    setDvar("ls_mapname", Mapname);
    setDvar("mapname", Mapname);
    setDvar("party_mapname", Mapname);
    setDvar("ui_mapname", Mapname);
    setDvar("ui_currentmap", Mapname);
    setDvar("ui_previewmap", Mapname);
    setDvar("ui_showmap", Mapname);
    map(Mapname);
}
GivePowerup(Powerup)
{
    self zm_powerups::specific_powerup_drop(Powerup, self.origin, undefined, undefined, undefined, 1);
}

BO4newOrigin(Coords, Location)
{
    if(!isDefined(Location))
        Location = "Undefined";
    self SetOrigin(Coords);
    self S("Teleported To "+Location);
}

acquireaat(id) {
    weapon = self getCurrentWeapon();
    self thread aat::acquire(weapon, id);
} 
//End Changes

bo4_CamoGiver(Camo) 
{
    Weapon = self GetCurrentWeapon();
    self TakeWeapon(Weapon);
    self GiveWeapon(Weapon, self CalcWeaponOptions(Int(Camo), 1, 1, true, true, true, true));
}

PSpeed()
{
    self endon(#"disconnect");
    
    self.PSpeed = isDefined(self.PSpeed) ? undefined : true;
    if(isDefined(self.PSpeed))
        self SetMoveSpeedScale(2);
    else
        self SetMoveSpeedScale(1);
}

GiveAllPerks()
{
    self thread zm_perks::function_cc24f525();
}

selfInstaKill()
{
    self.personal_instakill = isDefined(self.personal_instakill) ? undefined : true;
}

SaveLocation(Val)
{
    if(Val == 0)
    {
        self.SaveLocation      = self.origin;
        self.SaveLocationAngle = self.angles;
        if(!IsDefined(self.SaveLocTog))
            self.SaveLocTog = true;
            
        self iPrintLn("Current Position: ^2Saved");
    }
    else if(Val == 1)
    {
        if(!IsDefined(self.SaveLocTog))
            return self iPrintLnBold("^1Error: ^7No Location Saved");
            
        self SetPlayerAngles(self.SaveLocationAngle);
        self SetOrigin(self.SaveLocation);
        self iPrintLn("Saved Position: ^2Loaded");
    }
    else
    {
        self.SaveLocTog        = undefined;
        self.SaveLocation      = undefined;
        self.SaveLocationAngle = undefined;
    }
}

TpToChest()
{
    Chest = level.chests[level.chest_index];
    origin = Chest.zbarrier.origin;
    FORWARD = AnglesToForward(Chest.zbarrier.angles);
    right = AnglesToRight(Chest.zbarrier.angles);
    BAngles = VectorToAngles(right);
    BOrigin = origin - 48 * right;
    switch(randomInt(3))
    {
        case 0:
            BOrigin = BOrigin + 16 * right;
            break;
        case 1:
            BOrigin = BOrigin + 16 * FORWARD;
            break;
        case 2:
            BOrigin = BOrigin - 16 * right;
            break;
        case 3:
            BOrigin = BOrigin - 16 * FORWARD;
            break;
    }
    self SetOrigin(BOrigin);
    self SetPlayerAngles(BAngles);
}

BO4FreezeBox()
{
    level.chests[level.chest_index].no_fly_away = (!isDefined(level.chests[level.chest_index].no_fly_away) ? true : undefined);
}

Multijump(currentNum = 0)
{
    self endon(#"disconnect");
    self notify("SMulti");
    self.Multijump = isDefined(self.Multijump) ? undefined : true;
    self endon("SMulti");
    
    if(isDefined(self.Multijump))
        self setPerk("specialty_fallheight");
    else
        self unSetPerk("specialty_fallheight");
        
    while(IsDefined(self.Multijump))
    {
        if(self JumpButtonPressed() && currentNum < 15)
        {
            self setVelocity(self getVelocity() + (0, 0, 250));
            currentNum++;
        }
        if(currentNum == 15 && self isOnGround())
            currentNum = 0;

        wait .1;
    }
}

SuperJump()
{
    level.SuperJump = isDefined(level.SuperJump) ? undefined : true;
    if(isDefined(level.SuperJump))
    {
        foreach(player in level.players)
            player thread AllSuperJump();
    }
}

AllSuperJump()
{
    self endon(#"disconnect");
    while(isDefined(level.SuperJump))
    {
        if(self JumpButtonPressed())
        {
            for(i=0;i<5;i++)
                self SetVelocity(self GetVelocity() + (0, 0, 140));

            while(!self IsOnGround())
                wait .05;
        }
        wait .05; 
    }
}

SuperSpeed()
{
    level.SuperSpeed = isDefined(level.SuperSpeed) ? undefined : true;

    if(isDefined(level.SuperSpeed))
        setDvar(#"g_speed", 500);
    else
        setDvar(#"g_speed", 200);
}

BO4NoFallDam()
{
    level.BO4NoFallD = isDefined(level.BO4NoFallD) ? undefined : true;
    if(isDefined(self.BO4NoFallD))
    {
        SetDvar(#"bg_fallDamageMinHeight", 9999);
        SetDvar(#"bg_fallDamageMaxHeight", 9999);
    }
    else
    {
        setdvar(#"bg_falldamageminheight", 256);
		setdvar(#"bg_falldamagemaxheight", 512);
    }
}

AntiJoin()
{
    level.AntiJoin = isDefined(level.AntiJoin) ? undefined : true;
}

B4Gravity()
{
    level.B4Gravity = isDefined(level.B4Gravity) ? undefined : true;
    if(isDefined(level.B4Gravity))
        SetDvar("bg_gravity", 100);
    else
        SetDvar("bg_gravity", 350);
}

BO4Rev()
{
    self thread zm_laststand::auto_revive(self, 0, 0);
}

//Starting Gun Game//

GameModeHandler(gameModeSelected)
{
    if(!isDefined(level.GameModeSelected)){
        if(!isDefined(gameModeSelected))
        {
            self S("How the FUCK are you here?");
        }
        else if(gameModeSelected == "Gun Game")
        {
            self thread doGunGame();
            level.GameModeSelected=true;
        }else if(gameModeSelected == "All The Weapons")
        {
            self thread doAllWeaponsZM();
            level.GameModeSelected=true;
        }
    }
}

doGunGame()
{
        self thread KillAllZombies();
        self thread RoundEdit(15);
        foreach(player in level.players)
    {
        player thread CloseMenu1();
        player thread GunGame();
        player iPrintlnBold("^1G^7un ^1G^7ame");
        wait 2;
        player iPrintlnBold("^1H^7ave ^1F^7un !");
    }
}
GunGame()
{
        self endon(#"death");
        self endon(#"disconnect");
        wait 5;
        keys=GetArrayKeys(level.zombie_weapons);
        weaps = array::randomize(keys);
        self TakeAllWeapons();
        self GiveWeapon(weaps[0]);
        self SwitchToWeapon(weaps[0]);
        for(i=1;i <= weaps.size-1;i++)
    {
        self waittill(#"zom_kill");
        self iPrintlnBold("You got a new Weapon! Kill Count: ^1"+i);
        self TakeAllWeapons();
        self GiveWeapon(weaps[i]);
        self SwitchToWeapon(weaps[i]);
    }
}

DoAllWeaponsZM()
{
    self thread KillAllZombies();
    self thread RoundEdit(25);
    foreach(player in level.players)
    {
        player thread CloseMenu1();
        player thread AllWeaponsStart();
        player iPrintLnBold("^1All ^2The ^3Weapons");
        wait 2;
        player iPrintLnBold("^5Weapons will Rotate every ^645 ^3Seconds!");
    }
}

AllWeaponsStart()
{
    self endon(#"death");
    self endon(#"disconnect");
    wait 3;
    WeapKeys = GetArrayKeys(level.zombie_weapons_upgraded);
    PapWeaps = array::randomize(WeapKeys);
    self TakeAllWeapons();
    for(;;){
        i = randomIntRange(0, PapWeaps.size - 1);
        self GiveWeapon(PapWeaps[i]);
        self SwitchToWeapon(PapWeaps[i]);
        self iPrintLnBold("^1Awarded New Weapon");
        wait 45;
    }
}