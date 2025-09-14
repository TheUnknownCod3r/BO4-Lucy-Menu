GameModeHandler(gameModeSelected)
{
    if(!isDefined(level.GameModeSelected)){
        if(!isDefined(gameModeSelected))
        {
            self iPrintLn("How the FUCK are you here?");
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
        player iPrintLn("^1G^7un ^1G^7ame");
        wait 2;
        player iPrintLn("^1H^7ave ^1F^7un !");
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
        self iPrintLn("You got a new Weapon! Kill Count: ^1"+i);
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
        player iPrintLn("^1All ^2The ^3Weapons");
        wait 2;
        player iPrintLn("^5Weapons will Rotate every ^645 ^3Seconds!");
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
        self iPrintLn("^1Awarded New Weapon");
        wait 45;
    }
}