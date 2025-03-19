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

bo4_AddBotsToGame() 
{
    AddTestClient();
}