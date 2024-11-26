/*
###########################################
Basic Modifications
###########################################
*/
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

HUDDisable()
{
    self.HUDDisable = isDefined(self.HUDDisable) ? undefined : true;
    if (isDefined(self.HUDDisable))
        self setclientuivisibilityflag("hud_visible",0);
    else
        self setclientuivisibilityflag("hud_visible",1);
}

NoclipToggle1(player)
{
    player.Noclip = isDefined(player.Noclip) ? undefined : true;
    
    if(isDefined(player.Noclip))
    {
        player endon("disconnect");
        self S("Noclip ^2Enabled");
        if(player hasMenu() && player isInMenu())
            player closeMenu1();
        player DisableWeapons();
        player DisableOffHandWeapons();
        player.nocliplinker = spawnSM(player.origin, "tag_origin");
        player PlayerLinkTo(player.nocliplinker, "tag_origin");
        
        while(isDefined(player.Noclip) && isAlive(player))
        {
            if(player AttackButtonPressed())
                player.nocliplinker.origin = (player.nocliplinker.origin + (AnglesToForward(player GetPlayerAngles()) * 60));
            else if(player AdsButtonPressed())
                player.nocliplinker.origin = (player.nocliplinker.origin - (AnglesToForward(player GetPlayerAngles()) * 60));
            if(player MeleeButtonPressed())
                break;
            
            wait 0.01;
        }

        if(isDefined(player.Noclip))
            player NoclipToggle1(player);
    }
    else
    {
        player Unlink();
        player.nocliplinker delete();
        player EnableWeapons();
        player EnableOffHandWeapons();
        self S("Noclip ^1Disabled");
    }
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

ToggleRecoil()
{
    self.recoil = isDefined(self.recoil) ? undefined : true;
    if(isDefined(self.recoil))
    {
        self endon("disconnect");
        self S("No Recoil ^2Enabled");
        self.linked=false;
        self.recoilentity = spawnSM(self.origin, "tag_origin");
        while(isDefined(self.recoil))
        {
            if(self AttackButtonPressed()){
                self.recoilentity.origin = self.origin;
                self.recoilentity.angles = self.angles;
                self PlayerLinkTo(self.recoilentity, "tag_origin");
                self.linked=true;
            }
            else if(self.linked == true && !(self AttackButtonPressed()))
            {
                self unlink();
                self.linked=false;
            }
            wait .001;
        }
        if(isDefined(self.recoil))
            self ToggleRecoil();
    }
    else
    {
        self unlink();
        self iPrintLnBold("No Recoil ^1Off");
        self.recoilentity delete();
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
        self.ignoreme=true;
    else
        self.ignoreme=false;
}

PSpeed()
{
    self endon("disconnect");
    
    self.PSpeed = isDefined(self.PSpeed) ? undefined : true;
    if(isDefined(self.PSpeed))
        self SetMoveSpeedScale(2);
    else
        self SetMoveSpeedScale(1);
}

GetSelfRes()//Credit TheUnknownCod3r / MrFawkes1337
{
    self zm_laststand::function_3a00302e();//Awards One Self Revive at a time.
    self S("Self Revive ^1Awarded");
}

BO4Rev()
{
    self thread zm_laststand::auto_revive(self, 0, 0);
}

GiveAllPerks()
{
    self thread zm_perks::function_cc24f525();
}

PlayerGiveScore(value, player)
{
    player zm_score::add_to_player_score(value);
}

PlayerTakeScore(value, player)
{
    player zm_score::minus_to_player_score(value);
}

Clone()
{
    self util::spawn_player_clone(self);
}

/*
#############################################
Elixir Modification Scripts
Mapped By TheUnknownCoder / MrFawkes1337
#############################################
*/

GiveInstantElixir(name) //Works for Instant Elixirs
{
    self thread bgb::function_b7ba7d51(name);//Actually gives instant use elixir like Perkaholic etc, Doesnt work for timed Elixirs.
    self thread bgb::give(name);//gives popup for the Elixir on screen, should work for all
}
GiveTimedElixir(name)//Works for Timed Elixirs
{
    self thread bgb::function_62f40b0d(name);//Gives Timed Elixir, Doesnt work for Single Use Elixirs.
    self thread bgb::give(name);//Just for elixir popup
}

/*
##################################
Map Selection Stuff (WIP)
##################################
*/

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

/*
##################################################
Teleportalz :D
##################################################
*/

BO4newOrigin(Coords, Location)
{
    if(!isDefined(Location))
        Location = "Undefined";
    self SetOrigin(Coords);
    self S("Teleported To "+Location);
}

/*
########################################
Fun Modifications
########################################
*/

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

Multijump(currentNum = 0)
{
    self endon("disconnect");
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

LunaWolf()
{
    spawnactor(#"hash_3f174b9bcc408705", self.origin, self.angles, "wolf_protector", 1);
}

bo4_AddBotsToGame() 
{
    AddTestClient();
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

RoundEdit(value)//Renamed cause round999 wasn't really a good name for it now its on a slider.
{
    namespace_a28acff3::set_round_number(value);
    self thread KillAllZombies();
}
/*
####################################
Weapon Modifications
####################################

*/

GiveSvalinnGuard()
{
   self GiveWeapon(getWeapon("zhield_frost_dw"));
   self aat::acquire(getweapon("zhield_frost_dw"), "zm_aat_frostbite");
   self zm_pap_util::repack_weapon(getweapon("zhield_frost_dw"), 4);
   self.var_5ba94c1e = 1;
   self iPrintLnBold("Svalinn Guard ^2Given"); 
}

PlayEE2Song()
{
    level thread zm_audio::sndmusicsystem_stopandflush();
    waitframe(1);
    level thread zm_audio::sndmusicsystem_playstate("ee_song_2");
}

PlayAudioToClients(audioFile)//Future replacement
{
    if(!isDefined(audioFile)) return;
    level thread zm_audio::sndmusicsystem_stopandflush();
    waitframe(1);
    level thread zm_audio::sndmusicsystem_playstate(audioFile);
}

GetWeaponDisplayName()
{
    WeaponName = self GetCurrentWeapon().DisplayName;
    self iPrintLnBold(WeaponName);
}

GetWeaponHash()
{
    Weap = self GetCurrentWeapon().Name;
    wait .1;
    self iPrintLnBold("Weapon Hash: "+Weap);
}

GiveClientWeapon(WeaponName, player)
{
    self zm_weapons::give_build_kit_weapon(getweapon(WeaponName));
    self switchtoweapon(getweapon(WeaponName));
    wait .1;
    player giveMaxAmmo(getweapon(WeaponName));
    wait .1;
    player switchToWeapon(getweapon(WeaponName));
    player iPrintLnBold("You received "+WeaponName);
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
TakeAllPlayerWeaps(player)
{
    player takeAllWeapons();
    player iPrintLnBold("You just had your Weapons Taken!");
}

acquireaat(id) {
    weapon = self getCurrentWeapon();
    self thread aat::acquire(weapon, id);
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

bo4_CamoGiver(Camo) 
{
    Weapon = self GetCurrentWeapon();
    self TakeWeapon(Weapon);
    self GiveWeapon(Weapon, self CalcWeaponOptions(Int(Camo), 1, 1, true, true, true, true));
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

magicbullets()
{
    self.magicBullets = isDefined(self.magicBullets) ? undefined : true;
    if(isDefined(self.magicBullets))
    {
        self.bulletEffectType = "launcher_standard_t8_upgraded";
        self S("Magic Bullets Enabled, Effect: Rocket Launcher");
        while(isDefined(self.magicBullets))
        {
            self waittill(#"weapon_fired");
            MagicBullet(getWeapon(self.bulletEffectType), self getPlayerCameraPos(), BulletTrace(self getPlayerCameraPos(), self getPlayerCameraPos() + anglesToForward(self getPlayerAngles())  * 100000, false, self)["position"], self);
            wait .25;
        }
    }
    else 
    {
        self S("Magic Bullets ^1Disabled");
        self.bulletEffectType=undefined;
    }
}

changeBulletType(val)
{
    if(isDefined(self.bulletEffectType))
    {
        switch(val)
        {
            case 0: self.bulletEffectType=  "minigun"; self S("Bullet Effect Set To: Minigun"); break;
            case 1: self.bulletEffectType = "special_ballisticknife_t8_dw_upgraded"; self S("Bullet Effect Set To: Ballistic Knife"); break;
            case 2: self.bulletEffectType = "launcher_standard_t8_upgraded"; self S("Bullet Effect Set To: Rocket Launcher"); break;
            case 3: self.bulletEffectType = "ray_gun"; self S("Bullet Effect Set To: Ray Gun"); break;
        }
    }
    else
    {
        self S("Custom Bullet Effects are not Enabled");
    }
}

/*
######################
Powerups
######################
*/

GivePowerup(Powerup)
{
    self zm_powerups::specific_powerup_drop(Powerup, self.origin, undefined, undefined, undefined, 1);
}

/*
###############################
Zombies Modifications
###############################
*/
KillAllZombies(player) 
{
    level.zombie_total = 0;
    for(a=0;a<3;a++) //Gotta get those zombies killed :D
    {
        zombies = GetAISpeciesArray(level.zombie_team, "all");
        for(z=0;z<zombies.size;z++)
        {
            if(isDefined(zombies[z]) && IsAlive(zombies[z]))
            zombies[z] DoDamage(zombies[z].health + 99, zombies[z].origin);
        }
    }
    self iPrintLnBold("All Zombies ^1Eliminated");
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

/*
##############################################
Mystery Box Options
##############################################
*/

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

ShowAllBoxes()
{
    foreach(chest in level.chests)
	{
		chest zm_magicbox::show_chest();
	}
}

BoxPrice(value)
{
    foreach(chest in level.chests) chest.zombie_cost = value;

}

BO4FreezeBox()
{
    level.chests[level.chest_index].no_fly_away = (!isDefined(level.chests[level.chest_index].no_fly_away) ? true : undefined);
}
/*
#####################################
Rank and Stat Stuffs
#####################################
*/
BO4Level55(player)
{
    player AddRankXpValue("kill", 25160000);
    player rank::updaterank();
    wait .1;
    uploadStats(player);
    player iPrintLnBold("^2In order for the rank to save, please end the game via the pause menu and not the fast end!!!");
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
                    foreach(weap in level.zombie_weapons){
                        if(isdefined(weap.weapon.name)) {
                            player addweaponstat(weap.weapon, #"kills", 5000);//Normal Kills
                            player addweaponstat(weap.weapon, #"headshots", 5000);//Headshots
                            player addweaponstat(weap.weapon, #"allperkkills", 5000);//Kills with All Perks
                            player addweaponstat(weap.weapon, #"noperkkills", 5000);//No perks
                            player addweaponstat(weap.weapon, #"packedkills", 5000);//Pack a punched Kills
                            player addweaponstat(weap.weapon, #"heavykills", 5000);//Catalyst?
                            player addweaponstat(weap.weapon, #"minibosskills", 5000);//warden, Gladiatiors
                            player addweaponstat(weap.weapon, #"verminkills", 5000);//Dogs / Tigers
                            player addweaponstat(weap.weapon, #"crawlerkills", 5000);//Crawlers
                            player addweaponstat(weap.weapon, #"instakills", 5000);//Instakill
                            player addweaponstat(weap.weapon, #"hash_657e22dcdd18da77", 5000);//Pop Shocks Challenge
                            waitframe(1);
                            }
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

Dev_UnlockCamos(player)
{
    foreach(weap in level.zombie_weapons)
    {
            player addweaponstat(weap.weapon, #"kills", 5000);//Normal Kills
            player addweaponstat(weap.weapon, #"headshots", 5000);//Headshots
            player addweaponstat(weap.weapon, #"allperkkills", 5000);//Kills with All Perks
            player addweaponstat(weap.weapon, #"noperkkills", 5000);//No perks
            player addweaponstat(weap.weapon, #"packedkills", 5000);//Pack a punched Kills
            player addweaponstat(weap.weapon, #"heavykills", 5000);//Catalyst?
            player addweaponstat(weap.weapon, #"minibosskills", 5000);//warden, Gladiatiors
            player addweaponstat(weap.weapon, #"verminkills", 5000);//Dogs / Tigers
            player addweaponstat(weap.weapon, #"crawlerkills", 5000);//Crawlers
            player addweaponstat(weap.weapon, #"instakills", 5000);//Instakill
            player addweaponstat(weap.weapon, #"hash_657e22dcdd18da77", 5000);//Pop Shocks Challenge
            waitframe(1);
    }
    player S("All Camos Unlocked!");    
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

Achievements(player)
{
    Achievs = array("zm_office_cold_war", "zm_office_ice", "zm_office_shock", "zm_office_power", "zm_office_strike", "zm_office_office", "zm_office_crawl", "zm_office_gas", "zm_office_pentupagon", "zm_office_everywhere", "zm_red_tragedy","zm_red_follower","zm_red_tribute","zm_red_mountains","zm_red_no_obol","zm_red_sun","zm_red_wind","zm_red_eagle","zm_red_defense","zm_red_gods", "zm_white_shard","zm_white_starting","zm_white_unlock","zm_white_mod","zm_white_trap","zm_white_pap","zm_white_knuckles","zm_white_perk","zm_white_stun","zm_white_roof","zm_trophy_doctor_is_in", "zm_trials_round_30","zm_escape_most_escape","zm_escape_patch_up","zm_escape_hot_stuff","zm_escape_hist_reenact","zm_escape_match_made","zm_escape_west_side","zm_escape_senseless","zm_escape_gat","zm_escape_throw_dog", "zm_orange_ascend","zm_orange_bells","zm_orange_freeze","zm_orange_hounds","zm_orange_totems","zm_orange_pack","zm_orange_secret","zm_orange_power","zm_orange_ziplines","zm_orange_jar","ZM_ZODT8_TRIAL_STEP_1", "ZM_MANSION_ARTIFACT","ZM_MANSION_STAKE","ZM_MANSION_BOARD","ZM_MANSION_BITE","ZM_MANSION_QUICK","ZM_MANSION_ALCHEMICAL","ZM_MANSION_CRAFTING","ZM_MANSION_SHOCKING","ZM_MANSION_CLOCK","ZM_MANSION_SHRINKING", "zm_towers_challenges","zm_towers_get_ww","zm_towers_trap_build","zm_towers_ww_kills","zm_towers_kitty_kitty","zm_towers_dismember","zm_towers_boss_kill","zm_towers_arena_survive","zm_towers_fast_pap", "ZM_ZODT8_ARTIFACT","ZM_ZODT8_STOWAWAY","ZM_ZODT8_DEEP_END","ZM_ZODT8_LITTLE_PACK","ZM_ZODT8_SHORTCUT","ZM_ZODT8_TENTACLE","ZM_ZODT8_STOKING","ZM_ZODT8_ROCK_PAPER","ZM_ZODT8_SWIMMING","zm_trophy_jack_of_all_blades", "zm_trophy_straw_purchase","zm_trophy_perkaholic_relapse","zm_trophy_gold","zm_rush_personal_score","zm_rush_team_score","zm_rush_multiplier_100","mp_trophy_special_issue_weaponry","mp_trophy_special_issue_equipment", "wz_specialist_super_fan","wz_first_win","wz_not_a_fluke","wz_blackout_historian","wz_specialist_super_fan","wz_zombie_fanatic","mp_trophy_battle_tested","mp_trophy_welcome_to_the_club","MP_SPECIALIST_MEDALS","MP_MULTI_KILL_MEDALS", "mp_trophy_vanquisher");

    foreach(Achiev in Achievs) 
    {
        player GiveAchievement(Achiev);
        player iPrintLnBold("^2" + Achiev);
        wait .5;
    }
    wait .5;
    player iPrintLnBold("^6All Achievements Unlocked");
}

BO4SetPrestigeMax()
{
    currentPrestige = self stats::get_stat("playerstatslist", "plevel", "statvalue");
    if(currentPrestige == 11){
    self stats::set_stat("playerstatslist", "plevel", "statvalue", 11);
    self stats::set_stat("playerstatslist", "paragon_rank", "statvalue", 954);
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

/*
########################################
Host Modification Stuff
########################################
*/


ModvarTest()
{
    level.Modvars = isDefined(level.Modvars) ? undefined : true;
    if(isDefined(level.Modvars))
    {
        setDvar("g_speed", 300);
        setDvar("cg_fov", 300);
    }
    else 
    {
        self S("ModVars ^1Disabled");
        setDvar("g_speed", 100);
        setDvar("cg_fov", 100);
    }
}
ForceHostToggle()
{
    self.ForcingTheHost = isDefined(self.ForcingTheHost) ? undefined : true;
    if(isDefined(self.ForcingTheHost))
    {
    self iPrintLnBold("Force Host ^2ON");
    if(getDvarString("party_connectTimeout") != "0")
    {
        SetDvar("lobbySearchListenCountries", "0,103,6,5,8,13,16,23,25,32,34,24,37,42,44,50,71,74,76,75,82,84,88,31,90,18,35");
        SetDvar("excellentPing", 3);
        SetDvar("goodPing", 4);
        SetDvar("terriblePing", 5);
        SetDvar("migration_forceHost", 1);
        SetDvar("migration_minclientcount", 12);
        SetDvar("party_connectToOthers", 0);
        SetDvar("party_dedicatedOnly", 0);
        SetDvar("party_dedicatedMergeMinPlayers", 12);
        SetDvar("party_forceMigrateAfterRound", 0);
        SetDvar("party_forceMigrateOnMatchStartRegression", 0);
        SetDvar("party_joinInProgressAllowed", 1);
        SetDvar("allowAllNAT", 1);
        SetDvar("party_keepPartyAliveWhileMatchmaking", 1);
        SetDvar("party_mergingEnabled", 0);
        SetDvar("party_neverJoinRecent", 1);
        SetDvar("party_readyPercentRequired", .25);
        SetDvar("partyMigrate_disabled", 1);
        }
    } 
    else 
    {
        self iPrintLnBold("Force Host ^1OFF");
        SetDvar("lobbySearchListenCountries", "");
        SetDvar("excellentPing", 30);
        SetDvar("goodPing", 100);
        SetDvar("terriblePing", 500);
        SetDvar("migration_forceHost", 0);
        SetDvar("migration_minclientcount", 2);
        SetDvar("party_connectToOthers", 1);
        SetDvar("party_dedicatedOnly", 0);
        SetDvar("party_dedicatedMergeMinPlayers", 2);
        SetDvar("party_forceMigrateAfterRound", 0);
        SetDvar("party_forceMigrateOnMatchStartRegression", 0);
        SetDvar("party_joinInProgressAllowed", 1);
        SetDvar("allowAllNAT", 1);
        SetDvar("party_keepPartyAliveWhileMatchmaking", 1);
        SetDvar("party_mergingEnabled", 1);
        SetDvar("party_neverJoinRecent", 0);
        SetDvar("partyMigrate_disabled", 0);
    }
}

BO4NoFallDam()
{
    level.BO4NoFallD = isDefined(level.BO4NoFallD) ? undefined : true;
    if(isDefined(self.BO4NoFallD))
    {
        SetDvar("bg_fallDamageMinHeight", 9999);
        SetDvar("bg_fallDamageMaxHeight", 9999);
    }
    else
    {
        setdvar("bg_falldamageminheight", 256);
		setdvar("bg_falldamagemaxheight", 512);
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
    self endon("disconnect");
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
        setDvar("g_speed", 500);
    else
        setDvar("g_speed", 200);
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

PlayEESong()
{
    level thread zm_audio::sndmusicsystem_stopandflush();
	waitframe(1);
	level thread zm_audio::sndmusicsystem_playstate("ee_song");
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

BO4OriginPrint()
{
    current_origin = self.origin;
    self S("Coords: "+current_origin);
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

bo4_GivePerk(Perk_Name, string) 
{
    self zm_perks::vending_trigger_post_think(self, Perk_Name);
    self iPrintLnBold(Perk_Name + " ^2Given!");
}

KillPlayer(player)
{
    player notify("player_suicide");
    player zm_laststand::bleed_out();
    self iPrintLnBold("Killed "+player.name);
    player iPrintLnBold("You Just got murdered By: "+self.name);
}

sendToJail(player)
{
    if(!isDefined(level.JailCoords))
        self S("Jail Coords are Not Defined for the Map");
    
    player setOrigin(level.JailCoords);
    player S("You were sent to JAIL!");
}

PlayerMessage(val, player)//Wish I had a typewriter, lol.
{
    foreach(client in level.players)
    {
        if(val == 0){ client S(player.name+" Has a Mod Menu!");}
        else if(val == 1){ client S(player.name+" Is Cheating!!");}
        else if(val == 2){ client S(player.name+" is a Hacking Bitch!");}
        else if(val == 3){ client S(player.name+" Is a terrible Zombies Player!");}
        else if(val == 4){ client S(player.name+" Has a Tiny Pee Pee");}
        else if(val == 5){ client S("I put the new forgis on the jeep I trap until the bloody bottoms is underneath Cause all my niggas got it out the streets");}
        else if(val == 6){ client S("I keep a hunna racks inside my jeans I remember hittin the mall with the whole team Now a nigga cant answer calls cause im ballin");}
        else if(val == 7){ client S("I was wakin up gettin racks in the morning I was broke now Im rich these niggas salty");}
        else if(val == 8){ client S("All this designer on my body got me dripdrip ayy Straight up out the Yajects Im a big Crip If I got a pint of lean Imma sipsip");}
        else if(val == 9){ client S("I run the racks up with my queen like London and Nip But I got rich on all these niggas I didnt forget that");} 
        else if(val == 10){ client S("back I had to go through the struggle I didnt forget that");}
        else if(val == 11){ client S("I hopped inside of the Maybach and now I can sit back These bitches know me now cause I got them big racks");}
        else if(val == 12){ client S("Cause Im gettin money now I know you heard that Young nigga on the corner bitch I had to serve crack");}
        else if(val == 13){ client S("Uncle fronted me some Ps had to get them birds back We came up on dirty money I gave it a birdbath");}
        else if(val == 14){ client S("Cut off the brain and I give my bitch a new coupe Either you from the Yah Gang or youre SuWoop");}
        else if(val == 15){ client S("Got a New Orleans bitch and man, that pussy voodoo And Im that nigga now who knew?");}
        else if(val == 16){ client S("I been wakin up to get the money woahwoah Got a bad bitch her ass tatted woahwoah");}
        else if(val == 17){ client S("Givenchy to my toes two twins Im fucking em both I put her in a new AP the water like a boat");}
        else if(val == 18){ client S("I seen you swerve back cause Im in the black Bach New diamonds on me fuck a flash this aint Snapchat Cause I been gettin paid");}
        else if(val == 19){ client S("Yellow diamonds on me look like lemonade Got my baby mama that new Bentayga Tryna get the dough Joe like a sensei yeah");}
        else if(val == 20){ client S("Rolls Royce umbrellas when Im in the rain I just mind my business I got brothers that did the time I aint kiddin");}
        else if(val == 21){ client S("All these rappers just talk about it I live it Goin up I aint got no sky limit yeah yeah yeah");}//questionable, but sure lets have this here. ??
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

ModelSpawnTest()
{
        Jugg = util::spawn_model("p7_zm_vending_widows_wine", self.origin + (20, 20, 0));
        wait 2;
        Jugg SetScale(100);
}

test()
{
    self iPrintLnBold("Test");
}

TeleTo(arg, player)
{
    switch(arg)
    {
        case 0: self setOrigin(player.origin + (+30,0,0)); break;
        case 1: player setOrigin(self.origin+(+30,0,0)); break;
    }
}

ClientFuncs(args, val1)
{
    foreach(player in level.players)
    {
        switch(args)
        {
            case 0: player thread Godmode(); break;
            case 1: player thread UnlimitedAmmo(); break;
            case 2: player thread zm_score::add_to_player_score(40000000); break;
            case 3: player thread GiveAllPerks(); break;
        }
    }
}

ClientHandler(func, player)
{
    player endon("disconnect");
    level endon("game_ended");
    switch(func)
    {
        case 0: player thread Godmode(); break;
        case 1: player thread UnlimitedAmmo(); break;
        case 2: player thread BO4Level55(player); break;
        case 3: player thread PlasmaLoop(); break;
        case 4: player thread GiveAllPerks(); break;
        case 5: player thread GetSelfRes(); break;
        case 6: player thread BO4_UnlockAll(player); break;
        case 7: player thread BO4_MaxLevels(player); break;
        case 8: player thread zm_score::add_to_player_score(40000000); break;
        case 9: player thread zm_score::minus_to_player_score(40000000); break;
    }
}

S(Message)
{
    self iPrintLnBold(Message);
}

SetSelfRevives(count)
{
    foreach(player in level.players){
        player zm_laststand::function_3d685b5f(count);
        player S("Awarded "+count+" Self Revives");
    }
}

DownPlayer(player)
{
    player disableInvulnerability();
    player doDamage(player.health + 1, player.origin);
    self iPrintLnBold("Player ^1Downed");
    player iPrintLnBold("You Were Downed by "+self.name);
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

doGunGame()//Haha, thats kinda funny Criptic, Guess what I did here, before you :D
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
        self endon("death");
        self endon("disconnect");
        wait 5;
        keys=GetArrayKeys(level.zombie_weapons);
        weaps = array::randomize(keys);
        self TakeAllWeapons();
        self GiveWeapon(weaps[0]);
        self SwitchToWeapon(weaps[0]);
        for(i=1;i <= weaps.size-1;i++)
    {
        self waittill("zom_kill");
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
    self endon("death");
    self endon("disconnect");
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
