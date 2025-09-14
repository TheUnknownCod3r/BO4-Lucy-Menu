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