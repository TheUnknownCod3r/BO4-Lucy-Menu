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


PlayerExitLevel()
{
    ExitLevel(false);
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

BO4OriginPrint()
{
    current_origin = self.origin;
    self S("Coords: "+current_origin);
}

ActivatePAP(mapname)
{
    if(!isDefined(mapname)) mapname = level.script;
    switch(mapname)
    {
        case "zm_towers": level flag::set("zm_towers_pap_quest_completed"); level flag::set("zm_towers_pap_quest_sentinel_artifact_exploded"); wait .5; sentinel_model = getent("mdl_pap_quest_sentinel_artifact", "targetname"); sentinel_model delete(); wait .5; pap_debris_clip = getentarray("mdl_pap_room_debris_clip","targetname"); foreach (clip in pap_debris_clip) { clip connectPaths(); clip delete();} wait .5; var_10761775 = getent("t_pap_quest_place_head", "targetname"); var_10761775 delete(); var_8a3d82fc = getentarray("script_brush_lgt_pap_door", "targetname"); foreach(clip2 in var_8a3d82fc) clip2 delete(); exploder::exploder("exp_lgt_pap"); level flag::set("zm_towers_pap_quest_sentinel_artifact_exploded"); wait .5;     var_3075677 = getentarray("mdl_pap_quest_head", "targetname"); foreach(enemyHead in var_3075677){ enemyHead flag::clear(#"hash_26125a3306681e2"); enemyHead delete();} level flag::set("connect_pap_room_to_danu_ra_tunnel"); level flag::set("connect_pap_room_to_odin_zeus_tunnel"); wait .5; var_f7afe1a0 = getent("sarcophagus_destroyed","targetname"); var_f7afe1a0 delete(); self iPrintLnBold("Pap Opened, Walls will still appear"); break;
        case "zm_escape": level flag::set("power_on1"); level notify(#"hash_7e1d78666f0be68b"); wait 1; level flag::set(#"pap_quest_completed"); self iPrintLnBold("Not Added Yet"); break;
    }
}

RestartMap()
{
    map_restart(0);
}
