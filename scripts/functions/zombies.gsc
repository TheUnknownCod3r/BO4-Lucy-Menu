KillAllZombies() 
{
    level.zombie_total = 0;
    for(a=0;a<3;a++) //Gotta get those zombies killed :D
    {
        zombies = ReturnAIArray();
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
    foreach(zombie in ReturnAIArray()) 
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

notarget()
{
    self.NoTarg = isDefined(self.NoTarg) ? undefined : true;
    if (isDefined(self.NoTarg))
        self.ignoreme=true;
    else
        self.ignoreme=false;
}

selfInstaKill()
{
    self.personal_instakill = isDefined(self.personal_instakill) ? undefined : true;
}

RoundEdit(value)//Renamed cause round999 wasn't really a good name for it now its on a slider.
{
    namespace_a28acff3::set_round_number(value);
    self thread KillAllZombies();
}