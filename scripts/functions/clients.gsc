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
            case 1: player thread BetterUnlimitedAmmo(); break;
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
        case 1: player thread BetterUnlimitedAmmo(); break;
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
    self iPrintLn(Message);
}

SetSelfRevives(count)
{
    foreach(player in level.players){
        player zm_laststand::function_3d685b5f(count);
        player iPrintLn("Awarded "+count+" Self Revives");
    }
}

DownPlayer(player)
{
    player disableInvulnerability();
    player doDamage(player.health + 1, player.origin);
    self iPrintLn("Player ^1Downed");
    player iPrintLn("You Were Downed by "+self.name);
}

KillPlayer(player)
{
    player notify("player_suicide");
    player zm_laststand::bleed_out();
    self iPrintLn("Killed "+player.name);
    player iPrintLn("You Just got murdered By: "+self.name);
}

sendToJail(player)
{
    if(!isDefined(level.JailCoords)){
        self iPrintLn("Jail Coords are Not Defined for the Map"); return;}
    
    player setOrigin(level.JailCoords);
    player iPrintLn("You were sent to JAIL!");
}

TakeAllPlayerWeaps(player)
{
    player takeAllWeapons();
    player iPrintLn("You just had your Weapons Taken!");
}

PlayerMessage(val, player)//remove pointless messages
{
    foreach(client in level.players)
    {
        switch(val)
        {
            case 0: client S(player.name+" ^2Has a Mod Menu!");break;
            case 1: client S(player.name+" ^5Is Cheating!!");break;
            case 2: client S(player.name+" ^1is a Hacking Bitch!"); break;
            case 3: client S(player.name+" ^4Is a terrible Zombies Player!"); break;
            case 4: client S(player.name+" ^3Has a Tiny Pee Pee"); break;
        }
    }
}