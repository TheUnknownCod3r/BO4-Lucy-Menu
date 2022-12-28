addMenu(menu, title)
{
    if(!isDefined(self.menu["items"]))
        self.menu["items"] = [];
    if(!isDefined(self.menu["items"][menu]))
        self.menu["items"][menu] = SpawnStruct();
    if(!isDefined(self.menuParent))
        self.menuParent = [];
    
    if(!isDefined(self.temp))
        self.temp = [];
    if(isDefined(title))
        self.menu["items"][menu].title = title;
    if(isDefined(menu))
        self.temp["memory"] = menu;
    
    self.menu["items"][menu].name = [];
    self.menu["items"][menu].name2 = [];
    self.menu["items"][menu].func = [];
    self.menu["items"][menu].input1 = [];
    self.menu["items"][menu].input2 = [];
    self.menu["items"][menu].input3 = [];
    self.menu["items"][menu].input4 = [];
    self.menu["items"][menu].bool = [];
    self.menu["items"][menu].slider = [];
    self.menu["items"][menu].incslider = [];
    self.menu["items"][menu].incslidermin = [];
    self.menu["items"][menu].incsliderstart = [];
    self.menu["items"][menu].incslidermax = [];

    if(!isDefined(self.menu_B))
        self.menu_B = [];
    if(!isDefined(self.menu_B[menu]))
        self.menu_B[menu] = [];
    if(!isDefined(self.menu_S))
        self.menu_S = [];
    if(!isDefined(self.menu_S[menu]))
        self.menu_S[menu] = [];
    if(!isDefined(self.menu_SS))
        self.menu_SS = [];
    if(!isDefined(self.menu_SS[menu]))
        self.menu_SS[menu] = [];
    if(!isDefined(self.menu_ST))
        self.menu_ST = [];
    if(!isDefined(self.menu_ST[menu]))
        self.menu_ST[menu] = [];
}

addOpt(name, func, input1, input2, input3, input4)
{
    menu = self.temp["memory"];
    count = self.menu["items"][menu].name.size;
    
    if(isDefined(name))
        self.menu["items"][menu].name[count] = name;
    if(isDefined(func))
        self.menu["items"][menu].func[count] = func;
    if(isDefined(input1))
        self.menu["items"][menu].input1[count] = input1;
    if(isDefined(input2))
        self.menu["items"][menu].input2[count] = input2;
    if(isDefined(input3))
        self.menu["items"][menu].input3[count] = input3;
    if(isDefined(input4))
        self.menu["items"][menu].input4[count] = input4;
}

addOptBool(var, name, func, input1, input2, input3, input4)
{
    menu = self.temp["memory"];
    count = self.menu["items"][menu].name.size;
    
    if(isDefined(name))
        self.menu["items"][menu].name[count] = name;
    if(isDefined(func))
        self.menu["items"][menu].func[count] = func;
    if(isDefined(input1))
        self.menu["items"][menu].input1[count] = input1;
    if(isDefined(input2))
        self.menu["items"][menu].input2[count] = input2;
    if(isDefined(input3))
        self.menu["items"][menu].input3[count] = input3;
    if(isDefined(input4))
        self.menu["items"][menu].input4[count] = input4;
    self.menu["items"][menu].bool[count] = true;
    
    self.menu_B[menu][count] = (isDefined(var) && var) ? true : undefined;
}

addOptIncSlider(name, func, min, start, max, increment, input1, input2, input3, input4)
{
    menu = self.temp["memory"];
    count = self.menu["items"][menu].name.size;
    
    if(isDefined(name))
        self.menu["items"][menu].name[count] = name;
    if(isDefined(func))
        self.menu["items"][menu].func[count] = func;
    if(isDefined(input1))
        self.menu["items"][menu].input1[count] = input1;
    if(isDefined(input2))
        self.menu["items"][menu].input2[count] = input2;
    if(isDefined(input3))
        self.menu["items"][menu].input3[count] = input3;
    if(isDefined(input4))
        self.menu["items"][menu].input4[count] = input4;
    if(isDefined(min))
        self.menu["items"][menu].incslidermin[count] = min;
    if(isDefined(start))
        self.menu["items"][menu].incsliderstart[count] = start;
    if(isDefined(max))
        self.menu["items"][menu].incslidermax[count] = max;
    self.menu["items"][menu].intincrement[count] = (isDefined(increment) && increment) ? increment : 1;
    self.menu["items"][menu].incslider[count] = true;
    
    if(min == -1)
    {
        self.menu["items"][menu].incslidermin[count] = 0;
        self.menu_SS[menu][count] = start != min ? start : 0;
    }
    
    if(!isDefined(self.menu_SS[menu][count]))
        self.menu_SS[menu][count] = min;
}

addOptSlider(name, func, vals, input1, input2, input3, input4)
{
    if(!isDefined(vals))
        vals = "undefined slider";
    
    menu = self.temp["memory"];
    count = self.menu["items"][menu].name.size;
    
    self.menu_S[menu][count] = StrTok(vals, ";");
    if(isDefined(name))
        self.menu["items"][menu].name[count] = name;
    if(isDefined(func))
        self.menu["items"][menu].func[count] = func;
    if(isDefined(input1))
        self.menu["items"][menu].input1[count] = input1;
    if(isDefined(input2))
        self.menu["items"][menu].input2[count] = input2;
    if(isDefined(input3))
        self.menu["items"][menu].input3[count] = input3;
    if(isDefined(input4))
        self.menu["items"][menu].input4[count] = input4;
    self.menu["items"][menu].slider[count] = true;
    
    if(!isDefined(self.menu_SS[menu][count]))
        self.menu_SS[menu][count] = 0;
}

newMenu(menu)
{
    self endon("disconnect");
    self endon("menuClosed");
    
    if(!isDefined(menu))
    {
        menu = self BackMenu();
        self.menuParent[(self.menuParent.size - 1)] = undefined;
    }
    else
        self.menuParent[self.menuParent.size] = self getCurrent();
    
    self.menu["currentMenu"] = menu;
    self runMenuIndex(menu);
    self drawText();
}