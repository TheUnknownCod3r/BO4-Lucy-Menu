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

DemiGod()
{
    self.demiMode = isDefined(self.demiMode) ? undefined : true;

    if(isDefined(self.demiMode))
    {
        self endon("disconnect");

        while(isDefined(self.demiMode)) 
        {
            if(self.health < 100) {
                self.health = 100;
            }

            wait 0.05;
        }
    }
}

NoclipToggle1(player)
{
    player.Noclip = isDefined(player.Noclip) ? undefined : true;
    
    if(isDefined(player.Noclip))
    {
        player endon("disconnect");
        self iPrintLn("Noclip ^2Enabled");
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
        self iPrintLn("Noclip ^1Disabled");
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

BetterUnlimitedAmmo(val)
{
    self.betterUnlimitedAmmo = isDefined(self.betterUnlimitedAmmo) ? undefined : true;
    if(isDefined(self.betterUnlimitedAmmo))
    {   
        self endon("disconnect");

        while(isDefined(self.betterUnlimitedAmmo))
        {
            weapons = self GetWeaponsList();
            foreach(weapon in weapons)
            {
                if(weapon.isgadget) {
                    slot = self GadgetGetSlot(weapon);
                    if(self GadgetPowerGet(slot) < 100 && !self GetCurrentWeapon().isgadget || self GadgetPowerGet(slot) < 10 ) {
                        self GadgetPowerSet(slot, 100);
                    }
                } 
                else {
                    if(val == "Reload"){
                        //check if weapon is a shield
                        switch(weapon.name){ 
                            case "zhield_dw":
                            case "zhield_riot_dw":
                            case "zhield_zword_dw":
                            case "zhield_spectral_dw":
                            case "zhield_zpear_dw":
                            case "zhield_dw_upgraded":
                            case "zhield_riot_dw_upgraded":
                            case "zhield_zword_dw_upgraded":
                            case "zhield_spectral_dw_upgraded":
                            case "zhield_zpear_dw_upgraded":
                                self giveMaxAmmo(weapon); //need to do this or shield ammo will always be set to 0 for some reason...
                                break;
                            default: //set ammo stock to max for designated weapon if not a shield
                                self setWeaponAmmoStock(weapon, weapon.maxammo);                                 
                                break;
                        }
                    } 
                    else {
                        self giveMaxAmmo(weapon);
                        self SetWeaponAmmoClip(weapon, weapon.clipsize);
                    }
                }
            }
            wait .05;
        }
    }
}

ScoreOnlyIncreases() {

    self.onlyIncrease = isDefined(self.onlyIncrease) ? undefined : true;

    if (isDefined(self.onlyIncrease)) {

        self endon("disconnect");
        tempScore = self.score;

        while (isDefined(self.onlyIncrease)) {

            if (self.score < tempScore){
                self.score = tempScore;
            }
            else if(self.score > tempScore){
                tempScore = self.score;
            }

            wait 0.05;
        }
    }
}

ToggleRecoil()
{
    self.recoil = isDefined(self.recoil) ? undefined : true;
    if(isDefined(self.recoil))
    {
        self endon("disconnect");
        self iPrintLn("No Recoil ^2Enabled");
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
        self iPrintLn("No Recoil ^1Off");
        self.recoilentity delete();
    }
}

UnlimitedSprint() 
{
    self.UnlimitedSprint = isDefined(self.UnlimitedSprint) ? undefined : true;
    if (isDefined(self.UnlimitedSprint))
    {
        self setperk("specialty_unlimitedsprint");
        self iPrintLn("Unlimited Sprint ^2Enabled");
    } 
    else 
    {
        self unsetperk("specialty_unlimitedsprint");
        self iPrintLn("Unlimited Sprint ^1Disabled");
    }
}

PSpeed()
{
    self.PSpeed = isDefined(self.PSpeed) ? undefined : true;
    if(self.PSpeed) 
        self iPrintLn("x2 Movement ^2Enabled");
    else 
    { 
        self iPrintLn("x2 Movement ^1Disabled"); self setMoveSpeedScale(1);
    }
    while(isDefined(self.PSpeed)){
        self SetMoveSpeedScale(2);
        wait .01;
    }
}

ToggleKillAura()
{
    self.killAura = isDefined(self.killAura) ? undefined: true;
    if(self.killAura)
    {
        self thread KillAura();
        self iPrintLn("Kill Aura ^2Enabled");
    }
    else
    {
        self notify("end_kill_aura");
        self iPrintLn("Kill Aura ^1Disabled");
    }
}

ReturnAIArray()
{
    return GetAITeamArray(level.zombie_team);
}
KillAura()//Shaolin Shuffle Glitch on BO4??
{
    self endon("end_kill_aura");
    self endon("disconnect");

    for(;;)
    {
        zombies = GetAITeamArray(level.zombie_team);
        foreach (zombie in zombies)
        {
            if(distanceSquared(zombie.origin, self.origin) < 150 * 150)
            {
                zombie dodamage(zombie.health+1,self.origin,self,undefined,"MOD_EXPLOSIVE");
            }
        }
        wait .05;
    }
}

GetSelfRes()//Credit TheUnknownCod3r / MrFawkes1337
{
    self zm_laststand::function_3a00302e();//Awards One Self Revive at a time.
    self iPrintLn("Self Revive ^1Awarded");
}

BO4Rev()
{
    self thread zm_laststand::auto_revive(self, 0, 0);
}

GiveAllPerks()
{
    self thread zm_perks::function_cc24f525();
}

PlayerGiveScore(value)
{
    self zm_score::add_to_player_score(value);
}

PlayerTakeScore(value)
{
    self zm_score::minus_to_player_score(value);
}

SetFOV(Value)
{
    setDvar("cg_fov", Value);
    self iPrintLn("^4FOV Set To: ^1"+Value);
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
    self iPrintLn("Doors ^2Opened");
}