BO4Level55(player)
{
    player AddRankXpValue(#"kill", 2516000000);
    player rank::updaterank();
    wait .1;
    uploadStats(player);
    player iPrintLn("^2Rank and XP Set!");
}
BO4Level1000(player)
{
    player AddRankXpValue(#"kill", 2516000000);
    player SetParagonRank(999);
    player rank::updaterank();
    wait .1;
    uploadStats(player);
    player iPrintLn("^2Rank and XP Set!");
}
PlasmaLoop()
{
    self.PlasmaLoop2 = isDefined(self.PlasmaLoop2) ? undefined : true;
    if(!isDefined(self.PlasmaGiven)) self.PlasmaGiven = 0;
    if(isDefined(self.PlasmaLoop2)){
        while(isDefined(self.PlasmaLoop2))
        {
            self function_e8f77739(#"zm_timeplayed", 1000000);
            self.PlasmaGiven += 1000000;
            self iPrintLn("You Just Got 100k Plasma. Total: "+self.PlasmaGiven);
            wait 1;
        }
    }
}

PlasmaLoopplayer(player)
{
    player.PlasmaLoop = isDefined(player.PlasmaLoop) ? undefined : true;
    if(isDefined(player.PlasmaLoop))
    {
        while(isDefined(player.PlasmaLoop))
        {
            player function_e8f77739(#"zm_timeplayed", 1000000);
            wait .1;
        }
    }
}

bo4_MaxLevels(player)
{
    player endon("disconnect");
    self iPrintLn("^2Maxing Out Weapon Levels!");

    foreach(gun in level.zombie_weapons)
    {
        player stats::set_stat(#"hash_60e21f66eb3a1f18", gun.weapon.name, #"xp", 665535);
        player stats::set_stat(#"hash_60e21f66eb3a1f18", gun.weapon.name, #"plevel", 2);
        
        wait 0.01;
    }

    Attachments = Array(#"reflex", #"elo", #"acog", #"dualoptic", #"mms", #"holo");
    foreach(attachment in Attachments)
    {
        player stats::set_stat(#"hash_2ea32bf38705dfdc", attachment, #"kills", #"StatValue", 5000);
        player stats::set_stat(#"hash_2ea32bf38705dfdc", attachment, #"kills", #"ChallengeValue", 5000);

        wait 1;
    }

    wait 0.5;
    UploadStats(player);
    player iPrintLn("Max Weapon Ranks ^2Set");
}

bo4_UnlockAll(player)
{
    if(isDefined(player.UnlockAll))
        return;
    player.UnlockAll = true;
 
    player endon("disconnect");
    
    batchCount = 0; // how many stat entries since last UploadStats
    idx=0;
    player iPrintLn("Unlock All ^2Started");
    if(player != self)
        self iPrintLn(player getName() + ": Unlock All ^2Started");
    for(a=1;a<6;a++)
    {
        if(a == 4) //statsmilestones4.csv is an empty table. So we skip it
            a++;
        
        switch(a)
        {
            case 1:
                start = 1;
                end = 292;
                break;
            case 2:
                start = 292;
                end = 548;
                break;
            case 3:
                start = 548;
                end = 589;
                break;
            case 5:
                start = 1024;
                end = 1412;
                break;
            default:
                start = 0;
                end = 0;
                break;
        }
        
        for(value=start;value<end;value++)
        {
            stat         = SpawnStruct();
            stat.value   = Int(TableLookup("gamedata/stats/zm/statsmilestones" + a + ".csv", 0, value, 2));
            stat.type    = TableLookup("gamedata/stats/zm/statsmilestones" + a + ".csv", 0, value, 3);
            stat.name    = TableLookup("gamedata/stats/zm/statsmilestones" + a + ".csv", 0, value, 4);
            switch(stat.type)
            {
                case "global":
                    idx++;
                    player iPrintLn("(Global) Name: "+stat.name+" : Value: "+stat.value+", ("+idx+"/972)");
                    player stats::set_stat(#"PlayerStatsList", stat.name, #"StatValue", stat.value);
                    player stats::set_stat(#"PlayerStatsList", stat.name, #"Challengevalue", stat.value);
                    batchCount++;
                    break;
                case "attachment":
                    break; //Without column 13 on the tables, it's pretty useless. So we skip the attachment challenges.
                case "group":
                    idx++;
                    groups = Array(#"weapon_pistol", #"weapon_smg", #"weapon_assault", #"weapon_lmg", #"weapon_cqb", #"weapon_sniper", #"weapon_tactical", #"weapon_launcher", #"weapon_cqb", #"weapon_knife", #"weapon_special");
                    foreach(group in groups)
                    {
                        player iPrintLn("Group: "+group+", Name: "+stat.name+" : Value: "+stat.value+", ("+idx+"/972)");
                        player stats::set_stat(#"GroupStats", group, #"stats", stat.name, #"StatValue", stat.value);
                        player stats::set_stat(#"GroupStats", group, #"stats", stat.name, #"Challengevalue", stat.value);
                        wait 0.01;
                    }
                    batchCount++;
                    break;
                default:
                    idx++;
                    foreach(weap in level.zombie_weapons){
                        if(isdefined(weap.weapon)) {
                            player iPrintLn("(Camos) Name: "+stat.name+" : Value: "+stat.value+", ("+idx+"/972)");
                            player addweaponstat(weap.weapon, stat.name, 5000);
                            player addweaponstat(weap.weapon, #"kills",5000);
                            player addweaponstat(weap.weapon, #"headshots", 5000);
                            player addweaponstat(weap.weapon, #"packedkills", 5000);//Pack a punched Kills
                            //player addweaponstat(weap.weapon, #"kills_loaded", 5000);//Kills with 5 Attachments, Fixes #33
                            player addweaponstat(weap.weapon, #"heavykills", 5000);//Catalyst?
                            player addweaponstat(weap.weapon, #"minibosskills", 5000);//warden, Gladiatiors
                            player addweaponstat(weap.weapon, #"noperkkills", 5000);//No perks
                            player addweaponstat(weap.weapon, #"allperkkills", 5000);//Kills with All Perks
                            player addweaponstat(weap.weapon, #"verminkills", 5000);//Dogs / Tigers
                            player addweaponstat(weap.weapon, #"crawlerkills", 5000);//Crawlers
                            player addweaponstat(weap.weapon, #"instakills", 5000);//Instakill
                            player addweaponstat(weap.weapon, #"hash_657e22dcdd18da77", 5000);//Pop Shocks Challenge
                            wait 0.01;
                        }
                    }
                    batchCount++;
                    break;
            }
            wait 0.1;
            if(batchCount >= 25)
            {
                UploadStats(player);
                batchCount = 0;
            }
        }
    }
    if(batchCount > 0)
        UploadStats(player);
    
    player iPrintLn("Unlock All Challenges ^2Done");
    if(player != self)
        self iPrintLn(player getName() + ": Unlock All Challenges ^2Done");
}

CompleteActiveContracts(player)
{
    foreach(index, contract in player.pers["contracts"])
    {
        contractValue = contract.target_value;
        if(isDefined(contractValue) && contractValue)
            contract.current_value = contractValue;
    }
}

Achievements(player)
{
    Achievs = array("zm_office_cold_war", "zm_office_ice", "zm_office_shock", "zm_office_power", "zm_office_strike", "zm_office_office", "zm_office_crawl", "zm_office_gas", "zm_office_pentupagon", "zm_office_everywhere", "zm_red_tragedy","zm_red_follower","zm_red_tribute","zm_red_mountains","zm_red_no_obol","zm_red_sun","zm_red_wind","zm_red_eagle","zm_red_defense","zm_red_gods", "zm_white_shard","zm_white_starting","zm_white_unlock","zm_white_mod","zm_white_trap","zm_white_pap","zm_white_knuckles","zm_white_perk","zm_white_stun","zm_white_roof","zm_trophy_doctor_is_in", "zm_trials_round_30","zm_escape_most_escape","zm_escape_patch_up","zm_escape_hot_stuff","zm_escape_hist_reenact","zm_escape_match_made","zm_escape_west_side","zm_escape_senseless","zm_escape_gat","zm_escape_throw_dog", "zm_orange_ascend","zm_orange_bells","zm_orange_freeze","zm_orange_hounds","zm_orange_totems","zm_orange_pack","zm_orange_secret","zm_orange_power","zm_orange_ziplines","zm_orange_jar","ZM_ZODT8_TRIAL_STEP_1", "ZM_MANSION_ARTIFACT","ZM_MANSION_STAKE","ZM_MANSION_BOARD","ZM_MANSION_BITE","ZM_MANSION_QUICK","ZM_MANSION_ALCHEMICAL","ZM_MANSION_CRAFTING","ZM_MANSION_SHOCKING","ZM_MANSION_CLOCK","ZM_MANSION_SHRINKING", "zm_towers_challenges","zm_towers_get_ww","zm_towers_trap_build","zm_towers_ww_kills","zm_towers_kitty_kitty","zm_towers_dismember","zm_towers_boss_kill","zm_towers_arena_survive","zm_towers_fast_pap", "ZM_ZODT8_ARTIFACT","ZM_ZODT8_STOWAWAY","ZM_ZODT8_DEEP_END","ZM_ZODT8_LITTLE_PACK","ZM_ZODT8_SHORTCUT","ZM_ZODT8_TENTACLE","ZM_ZODT8_STOKING","ZM_ZODT8_ROCK_PAPER","ZM_ZODT8_SWIMMING","zm_trophy_jack_of_all_blades", "zm_trophy_straw_purchase","zm_trophy_perkaholic_relapse","zm_trophy_gold","zm_rush_personal_score","zm_rush_team_score","zm_rush_multiplier_100","mp_trophy_special_issue_weaponry","mp_trophy_special_issue_equipment", "wz_specialist_super_fan","wz_first_win","wz_not_a_fluke","wz_blackout_historian","wz_specialist_super_fan","wz_zombie_fanatic","mp_trophy_battle_tested","mp_trophy_welcome_to_the_club","MP_SPECIALIST_MEDALS","MP_MULTI_KILL_MEDALS", "mp_trophy_vanquisher");

    foreach(Achiev in Achievs) 
    {
        player GiveAchievement(Achiev);
        player iPrintLn("^2" + Achiev);
        wait .5;
    }
    wait .5;
    player iPrintLn("^6All Achievements Unlocked");
}

BO4SetPrestigeMax()
{
    currentPrestige = self stats::get_stat("playerstatslist", "plevel", "statvalue");
    if(currentPrestige == 11){
    self stats::set_stat("playerstatslist", "plevel", "statvalue", 11);
    self stats::set_stat("playerstatslist", "paragon_rank", "statvalue", 954);
    self stats::set_stat("playerstatslist", "paragon_rankxp", "statvalue", 251600000);
    self addRankXpValue("kill", 251600000);
    self rank::updaterank();
    wait .1;
    uploadStats(self);
    self iPrintLn("This should set you to master 1000");
    }
    else{
        self stats::set_stat("playerstatslist", "plevel", "statvalue", 10);
        self AddRankXpValue("kill", 25160000);
        self rank::updaterank();
        wait .1;
        uploadStats(self);
    }
}

StatEditor(amount,which)
{
    switch(which)
    {
        case 0: self zm_stats::function_ab006044("TOTAL_GAMES_PLAYED", amount); break;
        case 1: self zm_stats::function_1b763e4("HIGHEST_ROUND_REACHED", amount); break;
        case 2: self zm_stats::function_1b763e4("kills", amount); break;
        case 3: self zm_stats::function_1b763e4("MOST_HEADSHOTS", amount); break;
        case 4:  self zm_stats::function_ab006044("TOTAL_ROUNDS_SURVIVED", amount); self zm_stats::function_a6efb963("TOTAL_ROUNDS_SURVIVED", amount); self zm_stats::function_9288c79b("TOTAL_ROUNDS_SURVIVED", amount); break;
    }
}
