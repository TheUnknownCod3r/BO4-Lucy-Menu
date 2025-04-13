getName()
{
    name = self.name;
    if(name[0] != "[")
        return name;
    for(a=(name.size - 1);a>=0;a--)
        if(name[a] == "]")
            break;
    return GetSubStr(name, (a + 1));
}

isInMenu()
{
    if(!isDefined(self.playerSetting["isInMenu"]))
        return false;
    return true;
}

isInArray(array, text)
{
    for(a=0;a<array.size;a++)
        if(array[a] == text)
            return true;
    return false;
}

arrayRemove(array, value)
{
    if(!isDefined(array) || !isDefined(value))
        return;
    
    newArray = [];
    for(a=0;a<array.size;a++)
        if(array[a] != value)
            newArray[newArray.size] = array[a];
    return newArray;
}

getCurrent()
{
    return self.menu["currentMenu"];
}

getCursor()
{
    return self.menu["curs"][self getCurrent()];
}

setCursor(curs)
{
    self.menu["curs"][self getCurrent()] = curs;
}

SetSlider(slider)
{
    menu = self getCurrent();
    curs = self getCursor();
    max  = (self.menu_S[menu][curs].size - 1);
    
    if(slider > max)
        self.menu_SS[menu][curs] = 0;
    if(slider < 0)
        self.menu_SS[menu][curs] = max;
}

SetIncSlider(slider)
{
    menu = self getCurrent();
    curs = self getCursor();
    
    max = self.menu["items"][menu].incslidermax[curs];
    min = self.menu["items"][menu].incslidermin[curs];
    
    if(slider > max)
        self.menu_SS[menu][curs] = min;
    if(slider < min)
        self.menu_SS[menu][curs] = max;
}

BackMenu()
{
    return self.menuParent[(self.menuParent.size - 1)];
}

spawnSM(origin, model, angles)
{
    ent = Spawn("script_model", origin);
    ent SetModel(model);
    if(isDefined(angles))
        ent.angles = angles;
    
    return ent;
}

SetCustomXPMultiplier(value)
{
    if(value > 1)
    {
        self S("Custom XP Rate Enabled at "+value+"x"); 
        if(zm_utility::is_standard())
        {
            switch(level.players.size)
            {
                case 1: level.CustomXPValue = value * 0.55;
                        break;
                case 2: level.CustomXPValue = value * 0.75;
                        break;
                case 3: level.CustomXPValue = value * 0.9;
                        break;
                case 4: level.CustomXPValue = value * 1.1;
                        break;
            }
        }
        else 
        {
            switch (level.players.size) 
            {
                case 1:
                    level.CustomXPValue = value * 0.63;
                    break;
                case 2:
                    level.CustomXPValue = value * 0.75;
                    break;
                case 3:
                    level.CustomXPValue = value * 0.8;
                    break;
                case 4:
                    level.CustomXPValue = value * 0.95;
                    break;
            }
        }
        level.var_3426461d = &GetXPMultiplier;
        
    }
    else
    {
        level.customXPValue = undefined;
        self S("Custom XP Rate ^1Disabled");
        level.var_3426461d = &GetXPMultiplier; 
    }
}
GetXPMultiplier() 
{
    if(isDefined(level.customXPValue) && level.customXPValue >= 1){ return level.customXPValue; }
    n_multiplier = zombie_utility::function_d2dfacfd(#"hash_1ab42b4d7db4cb3c");
    if (zm_utility::is_standard()) 
    {
        switch (level.players.size) 
        {
        case 1:
            n_multiplier = n_multiplier * 0.55;
            break;
        case 2:
            n_multiplier = n_multiplier * 0.75;
            break;
        case 3:
            n_multiplier = n_multiplier * 0.9;
            break;
        case 4:
            n_multiplier = n_multiplier * 1.1;
            break;
        }
    } 
    else 
    {
        switch (level.players.size) 
        {
        case 1:
            n_multiplier = n_multiplier * 0.63;
            break;
        case 2:
            n_multiplier = n_multiplier * 0.75;
            break;
        case 3:
            n_multiplier = n_multiplier * 0.8;
            break;
        case 4:
            n_multiplier = n_multiplier * 0.95;
            break;
        }
    }
    return n_multiplier;
}