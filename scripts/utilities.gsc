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

PlayerExitLevel()
{
    ExitLevel(false);
}

spawnSM(origin, model, angles)
{
    ent = Spawn("script_model", origin);
    ent SetModel(model);
    if(isDefined(angles))
        ent.angles = angles;
    
    return ent;
}