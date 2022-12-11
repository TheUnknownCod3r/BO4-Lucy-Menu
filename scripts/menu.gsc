runMenuIndex(menu)
{
    self endon(#"disconnect");

    if(!isDefined(menu))
        menu = "Main";
    
    switch(menu)
    {
        case "Main":
            self addMenu(menu, level.menuName);
            if(self getVerification() > 0)
            {
                self addOpt("Personal Menu", &newMenu, "Personal Menu");
                self addOpt("Fun Menu", &newMenu, "Fun Menu");
                self addOpt("Elixir Menu", &newMenu, "Elixir Menu");
                self addOpt("Weapon Menu", &newMenu, "Weapon Menu");
                self addOpt("Powerups Menu", &newMenu, "Powerups Menu");
                self addOpt("Zombie Menu", &newMenu, "Zombie Menu");
                self addOpt("Mystery Box Menu", &newMenu, "Mystery Box Menu");
                self addOpt("Account Menu", &newMenu, "Account Menu");
                self addOpt("Map Selection", &newMenu, "Map Selection");
                self addOpt("Teleport Menu", &newMenu, "Teleport Menu");
                if(self getVerification() > 1)
                {
                    if(self getVerification() > 2)
                    {
                        if(self getVerification() > 3)
                        {
                            if(self IsHost() || self getVerification() > 3)
                                self addOpt("Host Menu", &newMenu, "Host Menu");
                                self addOpt("Player Menu", &newMenu, "Players");
                                self addOpt("All Players Options", &newMenu, "AllClient");
                                if(!isDefined(level.GameModeSelected))
                                    self addOpt("GameModes", &newMenu, "GameModes");
                        }
                    }
                }
            }
            break;
        case "AllClient":
            self addMenu(menu, "All Client Options");
                self addOpt("All God Mode", &ClientFuncs, "GodMode", undefined);
                self addOpt("All Unlimited Ammo", &ClientFuncs, "Ammo", undefined);
                self addOpt("All Max Points", &ClientFuncs, "Points", undefined);
                self addOpt("Give Everyone All Perks", &ClientFuncs, "Perks", undefined);
                self addOptIncSlider("Self Revives", &SetSelfRevives, 0, 0, 125, 5);
        break;
        case "GameModes":
            self addMenu(menu, "Game Modes");
                self addOpt("All The Weapons", &GameModeHandler, "All The Weapons");
                self addOpt("Gun Game", &GameModeHandler, "Gun Game");
        break;
        case "Host Menu":
            self addMenu(menu, "Host Menu");
                self addOptBool(level.BO4NoFallD, "No Fall", &BO4NoFallDam);
                self addOptBool(level.SuperJump, "Super Jump", &SuperJump);
                self addOptBool(level.SuperSpeed, "Super Speed", &SuperSpeed);
                self addoptBool(level.B4Gravity, "Low Gravity", &B4Gravity);
                self addOpt("Print Prestige", &BO4GetPrestige);
                self addOpt("Print Current Level", &BO4GetLevel);
                self addOpt("Anti Join", &AntiJoin);
                self addOpt("Play EE Song", &PlayEESong);
                self addOptBool(self.AntiQuit, "Anti Quit", &AntiQuit);
                self addOpt("Exit Level", &PlayerExitLevel);
                self addOpt("Print Coords", &BO4OriginPrint);
                self addOpt("Restart Map", &RestartMap);
            break;
        case "Players":
            self addMenu(menu, "Players");
                foreach(player in level.players)
                {
                    if(!isDefined(player.playerSetting["verification"]))
                        player.playerSetting["verification"] = level.MenuStatus[level.AutoVerify];
                    
                    self addOpt("[^5" + player.playerSetting["verification"] + "^6]" + player getName(), &newMenu, "Options " + player GetEntityNumber());
                }
            break;
        default:
            foundplayer = false;
            for(a=0;a<level.players.size;a++)
            {
                sepmenu = StrTok(menu, " ");
                if(int(sepmenu[(sepmenu.size - 1)]) == level.players[a] GetEntityNumber())
                {
                    foundplayer = true;
                    self MenuOptionsPlayer(menu, level.players[a]);
                }
            }
            
            if(!foundplayer)
            {
                self addMenu(menu, "404 ERROR");
                    self addOpt("Page Not Found");
            }
            break;
    }
}

MenuOptionsPlayer(menu, player)
{
    self endon(#"disconnect");
    
    sepmenu = StrTok(menu, " " + player GetEntityNumber());
    newmenu = "";
    for(a=0;a<sepmenu.size;a++)
    {
        newmenu += sepmenu[a];
        if(a != (sepmenu.size - 1))
            newmenu += " ";
    }
    
    switch(newmenu)
    {
        case "Personal Menu":
            self addMenu(menu, "Personal Menu");
                self addOptBool(self.godmode, "God Mode", &Godmode);
                self addOptBool(self.UnlimitedAmmo, "Unlimited Ammo", &UnlimitedAmmo);
                self addOptBool(self.thirdperson, "Third Person", &thirdperson);
                self addOptBool(self.UnlimitedSprint, "Unlimited Sprint", &UnlimitedSprint);
                self addOptBool(self.NoTarg, "No Target", &notarget);
                self addOptBool(self.promod, "Promod", &ProMod);
                self addOptBool(self.PSpeed, "x2 Speed", &PSpeed);
                self addOpt("Award Self Res", &GetSelfRes);
                self addOpt("Revive Yourself", &BO4Rev);
                self addOpt("All Perks", &GiveAllPerks);
                self addOpt("Score Menu", &newMenu, "Score Menu");
                self addOpt("Clone", &Clone);
        break;
        case "Elixir Menu":
            self addMenu(menu, "Elixir Menu");//Should be complete
            self addOpt("Mega Elixirs", &newMenu, "Mega Elixirs");
            self addOpt("Legendary Elixirs", &newMenu, "Legendary Elixirs");
            self addOpt("Rare Elixirs", &newMenu, "Rare Elixirs");
            self addOpt("Common Elixirs", &newMenu, "Common Elixirs");
            self addOpt("Classic Elixirs", &newMenu, "Classic Elixirs");
        break;
        case "Mega Elixirs":
            self addMenu(menu, "Mega Elixirs");//Done
                self addOpt("Shopping Free", &GiveElixir2, "zm_bgb_shopping_free");
                self addOpt("Head Drama", &GiveElixir2, "zm_bgb_head_drama");
                self addOpt("Secret Shopper", &GiveElixir2, "zm_bgb_secret_shopper");
                self addOpt("Reign Drops", &BO4GiveElixir, "zm_bgb_reign_drops");
                self addOpt("Power Vacuum", &GiveElixir2, "zm_bgb_power_vacuum");
                self addOpt("Near Death Experience", &GiveElixir2, "zm_bgb_near_death_experience");
                self addOpt("Phoenix Up", &BO4GiveElixir, "zm_bgb_phoenix_up");
                self addOpt("Conflagration Liquidation", &BO4GiveElixir, "zm_bgb_conflagration_liquidation");
                self addOpt("Join The Party", &BO4GiveElixir, "zm_bgb_join_the_party");
                self addOpt("Perkaholic", &BO4GiveElixir, "zm_bgb_perkaholic");
                self addOpt("Refresh Mint", &BO4GiveElixir, "zm_bgb_refresh_mint");
                self addOpt("Suit Up", &BO4GiveElixir, "zm_bgb_suit_up");
                self addOpt("Wall Power", &GiveElixir2, "zm_bgb_wall_power");
        break;
        case "Legendary Elixirs":
            self addMenu(menu, "Legendary Elixirs");//Done
                self addOpt("Cache Back", &BO4GiveElixir, "zm_bgb_cache_back");
                self addOpt("Dividend Yield", &GiveElixir2, "zm_bgb_dividend_yield");
                self addOpt("Free Fire", &GiveElixir2, "zm_bgb_free_fire");
                self addOpt("Perk Up", &BO4GiveElixir, "zm_bgb_perk_up");
                self addOpt("Power Keg", &BO4GiveElixir, "zm_bgb_power_keg");
                self addOpt("Wall To Wall Clearance", &GiveElixir2, "zm_bgb_wall_to_wall_clearance");
                self addOpt("Undead Man Walking", &GiveElixir2, "zm_bgb_undead_man_walking");
        break;
        case "Rare Elixirs":
            self addMenu(menu, "Rare Elixirs");
                self addOpt("Alchemical Antithesis", &GiveElixir2, "zm_bgb_alchemical_antithesis");
                self addOpt("Blood Debt", &GiveElixir2, "zm_bgb_blood_debt");
                self addOpt("Extra Credit", &BO4GiveElixir, "zm_bgb_extra_credit");
                self addOpt("Immolation Liquidation", &BO4GiveElixir, "zm_bgb_immolation_liquidation");
                self addOpt("Kill Joy", &BO4GiveElixir, "zm_bgb_kill_joy");
                self addOpt("Shields Up", &BO4GiveElixir, "zm_bgb_shields_up");
                self addOpt("Talkin Bout Regeneration", &GiveElixir2, "zm_bgb_talkin_bout_regeneration");
        break;
        case "Common Elixirs":
            self addMenu(menu, "Common Elixirs");//Done
                self addOpt("Bullet Boost", &BO4GiveElixir, "zm_bgb_bullet_boost");
                self addOpt("CTRL-Z", &GiveElixir2, "zm_bgb_ctrl_z");
                self addOpt("Dead of Nuclear Winter", &BO4GiveElixir, "zm_bgb_dead_of_nuclear_winter");
                self addOpt("In Plain Sight", &GiveElixir2, "zm_bgb_in_plain_sight");
                self addOpt("Licensed Contractor", &BO4GiveElixir, "zm_bgb_licensed_contractor");
                self addOpt("Phantom Reload", &GiveElixir2, "zm_bgb_phantom_reload");
                self addOpt("Sword Flay", &GiveElixir2, "zm_bgb_sword_flay");
                self addOpt("Who's Keeping Score", &BO4GiveElixir, "zm_bgb_whos_keeping_score");

        break;
        case "Classic Elixirs":
            self addMenu(menu, "Classic Elixirs");//complete, All Elixirs Work
                self addOpt("Always Done Swiftly", &GiveElixir2, "zm_bgb_always_done_swiftly");
                self addOpt("Anywhere But Here", &BO4GiveElixir, "zm_bgb_anywhere_but_here");
                self addOpt("Burned Out", &GiveElixir2, "zm_bgb_burned_out");
                self addOpt("Equip Mint", &BO4GiveElixir, "zm_bgb_equip_mint");
                self addOpt("Head Scan", &GiveElixir2, "zm_bgb_head_scan");
                self addOpt("Temporal Gift", &GiveElixir2, "zm_bgb_temporal_gift");
                self addOpt("Aftertaste", &GiveElixir2, "zm_bgb_aftertaste");
                self addOpt("Point Drops", &BO4GiveElixir, "zm_bgb_point_drops");
                self addOpt("Anti-Entrapment", &GiveElixir2, "zm_bgb_anti_entrapment");
                self addOpt("Nowhere But There", &BO4GiveElixir, "zm_bgb_nowhere_but_there");
                self addOpt("Now You See Me", &GiveElixir2, "zm_bgb_now_you_see_me");
                self addOpt("Arsenal Accelerator", &GiveElixir2, "zm_bgb_arsenal_accelerator");
                self addOpt("Pop Shocks", &GiveElixir2, "zm_bgb_pop_shocks");
                self addOpt("Stock Option", &GiveElixir2, "zm_bgb_stock_option");
                self addOpt("Newtonian Negation", &GiveElixir2, "zm_bgb_newtonian_negation");
                self addOpt("Quacknarok", &GiveElixir2, "zm_bgb_quacknarok");
        break;
        case "Map Selection":
            self addMenu(menu, "Map Selection");
                self addOpt("IX", &ChangeMap, "zm_towers");
                self addOpt("Blood Of The Dead", &ChangeMap, "zm_escape");
                self addOpt("Voyage of Despair", &ChangeMap, "zm_zodt8");
                self addOpt("Dead of The Night", &ChangeMap, "zm_mansion");
                self addOpt("Ancient Evil", &ChangeMap, "zm_red");
                self addOpt("Alpha Omega", &ChangeMap, "zm_white");
                self addOpt("Classified", &ChangeMap, "zm_office");
                self addOpt("Tag Der Toten", &ChangeMap, "zm_orange");
        break;
        case "Teleport Menu": //Coords, Loc name for iprint
            self addMenu(menu, "Teleport Menu");
                if(BO4GetMap() == "IX"){
                    self addOpt("IX", &test);
                }
                else if(BO4GetMap() == "Blood"){
                    self addOpt("Richtofen's Lab", &BO4NewOrigin, (9953.67, 11261.1, 256.125), "Richtofen's Lab");
                    self addOpt("West Grounds", &BO4NewOrigin, (8661.22, 10287.5, 513.077), "West Grounds");
                    self addOpt("Power Switch One", &BO4NewOrigin, (8892.1, 8851.01, 423.469), "Power Switch One");
                    self addOpt("New Industries", &BO4NewOrigin, (7083.19, 11134.6, 311.625), "New Industries");
                    self addOpt("Recreation Yard", &BO4NewOrigin, (4836.18, 10932.7, 1016.13), "Recreation Yard");
                    self addOpt("Cafeteria", &BO4NewOrigin, (2589.46, 9645.69, 1336.13), "Cafeteria");
                    self addOpt("2nd Floor Cell Block", &BO4NewOrigin, (869.781, 9690.19, 1443.13), "2nd Floor Cell Block");
                    self addOpt("Wardens Office", &BO4NewOrigin, (-588.591, 8613.38, 1336.13), "Wardens Office");
                    self addOpt("Wardens House", &BO4NewOrigin, (-2382.56, 7745.07, 1304.13), "Wardens House");
                    self addOpt("Citadel Tunnels", &BO4NewOrigin, (420.385,9506.33,1104.13), "Citadel Tunnels");
                    self addOpt("Building 64 Powerhouse", &BO4NewOrigin, (-1037.37, 6576.8, 70.1152), "Building 64 Powerhouse");
                    self addOpt("Docks", &BO4NewOrigin, (-543.102, 5451.18, -71.875), "Docks");
                    self addOpt("Prison Roof", &BO4NewOrigin, (3467.25, 9740.63, 1704.13), "Prison Roof");
                }
                else if(BO4GetMap() == "Voyage"){
                    self addOpt("Voyage", &test);
                }
                else if(BO4GetMap() == "Classified"){
                    self addOpt("Conference Room", &BO4newOrigin, (-911.255, 2531.01, 16.125), "Conference Room");
                    self addOpt("Main Offices", &BO4newOrigin, (333.581, 2069.82, 16.125), "Main Offices");
                    self addOpt("War Room Upper Level", &BO4newOrigin, (-1468.32, 2040.02, -303.875), "War Room Upper Level");
                    self addOpt("War Room Lower Level", &BO4newOrigin, (-317.895, 2114.2, -511.875), "War Room Lower Level");
                    self addOpt("Laboratories", &BO4newOrigin, (333.581, 2069.82, 16.125), "Laboratories");
                }
                else if(BO4GetMap() == "Dead"){
                    self addOpt("Dead of The Night", &test);
                }
                else if(BO4GetMap() == "AE"){
                    self addOpt("Ancient Evil", &test);
                }
                else if(BO4GetMap() == "AO"){
                    self addOpt("Alpha Omega", &test);
                }
                else if(BO4GetMap() == "Tag"){
                    self addOpt("Tag Der Toten", &test);
                }
        break;
        case "Score Menu":
            self addMenu(menu, "Score");
                self addOpt("Max Points", &PlayerGiveScore, 4000000, player);
                self addOpt("Take Points", &PlayerTakeScore, 4000000, player);
                self addOptIncSlider("Add Points", &PlayerGiveScore, 0, 0, 1000000, 10000, player);
                self addOptIncSlider("Take Points", &PlayerTakeScore, 0, 0, 1000000, 10000, player);
            break;

        case "Fun Menu":
            self addMenu(menu, "Fun Menu");
            self addOptBool(self.aimbot, "Aimbot", &bo4_toggleaimbot);
            self addOptBool(self.TeleGun, "Teleport Gun", &StartTeleGun);
            self addOptBool(self.HideWeapon, "Hide Gun", &HideGun);
            self addOptBool(self.Multijump, "Multi Jump", &Multijump);
            self addOptBool(self.personal_instakill, "Insta Kill", &selfInstaKill);
            self addOpt("Spawn Luna Wolf", &LunaWolf);
            self addOpt("Add Bot", &bo4_AddBotsToGame);
            self addOpt("Open All Doors", &BO4_OpenAllDoors);
            self addOptIncSlider("Edit Round: ", &RoundEdit, 0, 0, 300, 1);   
            self addOpt("Save Location", &SaveLocation, 0);
            self addOpt("Load Location", &SaveLocation, 1);
        break;

        case "Weapon Menu":
            self addMenu(menu, "Weapon Menu");
            self addOpt("Weapon Selector", &newMenu, "Weapon Selector");
            self addOpt("Map Specific Weapons", &newMenu, "Map Specific Weapons");
            self addOpt("Camo Selector", &newMenu, "Camo Selector");
            self addOpt("Upgrade Weapon", &UpgradeWeapon);
            self addOpt("Pack a Punch Effects", &newMenu, "Pack a Punch Effects");
            self addOpt("Drop Weapon", &DropWeapon);
            self addOpt("Take All Weapons", &TakeWeapons);
            self addOpt("Take Current Weapon", &TakeCurrentWeapon);
        break;
        case "Map Specific Weapons":
            self addMenu(menu, "Map Specific Weapons");
            if(BO4GetMap() == "Voyage"){
                self addOpt("Kraken", &GiveKraken);
            }
            else if(BO4GetMap() == "IX"){
                self addOpt("Death of Orion", &GiveDOO);
            }
            else if(BO4GetMap() == "Blood"){
                self addOpt("Blundergat", &BO4GiveBG);
                self addOpt("Monkey Bombs", &BO4GiveWeapon, "cymbal_monkey");
                self addOpt("Hells Retriever", &BO4GiveWeapon, "tomahawk_t8");
                self addOpt("Hells Redeemer", &BO4GiveWeapon, "tomahawk_t8_upgraded");
                self addOpt("Magmagat", &BO4GiveMG);
                self addOpt("AcidGat", &BO4GiveAG);
                self addOpt("Spoon", &BO4GiveSpoon);
                self addOpt("Golden Spork", &BO4GiveSpork);
            }
            else if(BO4GetMap() == "Dead"){
                self addOpt("Give Savage Impaler", &DoWWDotn1);
                self addOpt("Give Alistairs Folly", &DoWWDotn2);
            }else if(BO4GetMap() == "AE"){
                self addOpt("Hand of Ouranous", &BO4GiveWeapon, "ww_hand_o_upgraded");
                self addOpt("Hand of Hemera", &BO4GiveWeapon, "ww_hand_h_upgraded");
                self addOpt("Hand of Gaia", &BO4GiveWeapon, "ww_hand_g_upgraded");
                self addOpt("Hand of Charon", &BO4GiveWeapon, "ww_hand_c_upgraded");
            }
        break;
        case "Pack a Punch Effects":
            self addMenu(menu, "Pack a Punch Effects");
            self addOpt("Brain Rot", &acquireaat, "zm_aat_brain_decay");
            self addOpt("Fire Burst", &acquireaat, "zm_aat_plasmatic_burst");
            self addOpt("Kill o Watt", &acquireaat, "zm_aat_kill_o_watt");
            self addOpt("Cryofreeze", &acquireaat, "zm_aat_frostbite");
            self addOpt("Remove Effect", &RemoveEff, self GetCurrentWeapon());
        break;
        case "Camo Selector":
        self addMenu(menu, "Camo Selector");
            for(a=0;a<96;a++)
                    self addOpt("Camo: " + (a + 1), &bo4_CamoGiver, a);
        break;

        case "Weapon Selector":
            self addMenu(menu, "Weapon Selector");
            self addOpt("^0 == Assault Rifles ==");
            self addOpt("Give ICR-7", &BO4GiveWeapon, "ar_accurate_t8");
            self addOpt("Give Maddox RFB", &BO4GiveWeapon, "ar_fastfire_t8");
            self addOpt("Give Rampart 17", &BO4GiveWeapon, "ar_damage_t8");
            self addOpt("Give Vapr-XKG", &BO4GiveWeapon, "ar_stealth_t8");
            self addOpt("Give KN-57", &BO4GiveWeapon, "ar_modular_t8");
            self addOpt("Give Hitchcock M9", &BO4GiveWeapon, "ar_mg1909_t8");

            self addOpt("^0 == Submachine Guns ==");
            self addOpt("Give MX9", &BO4GiveWeapon, "smg_standard_t8");
            self addOpt("Give Saug 9mm", &BO4GiveWeapon, "smg_handling_t8");
            self addOpt("Give Spitfire", &BO4GiveWeapon, "smg_fastfire_t8");
            self addOpt("Give Cordite", &BO4GiveWeapon, "smg_capacity_t8");
            self addOpt("Give GKS", &BO4GiveWeapon, "smg_accurate_t8");
            self addOpt("Give Escargot", &BO4GiveWeapon, "smg_drum_pistol_t8");

            self addOpt("^0 == Tactical Rifles ==");
            self addOpt("Give Auger DMR", &BO4GiveWeapon, "tr_powersemi_t8");
            self addOpt("Give Swordfish", &BO4GiveWeapon, "tr_longburst_t8");
            self addOpt("Give ABR 223", &BO4GiveWeapon, "tr_midburst_t8");

            self addOpt("^0 == Lightmachine Guns ==");
            self addOpt("Give VKM 750", &BO4GiveWeapon, "lmg_heavy_t8");
            self addOpt("Give Hades", &BO4GiveWeapon, "lmg_spray_t8");
            self addOpt("Give Titan", &BO4GiveWeapon, "lmg_standard_t8");

            self addOpt("^0 == Sniper Rifles ==");
            self addOpt("Give Outlaw", &BO4GiveWeapon, "sniper_fastrechamber_t8");
            self addOpt("Give Paladin HB50", &BO4GiveWeapon, "sniper_powerbolt_t8");
            self addOpt("Give SDM", &BO4GiveWeapon, "sniper_powersemi_t8");
            self addOpt("Give Koshka", &BO4GiveWeapon, "sniper_quickscope_t8");

            self addOpt("^0 == Pistols ==");
            self addOpt("Give RK 7 Garrison", &BO4GiveWeapon, "pistol_burst_t8");
            self addOpt("Give Mozu", &BO4GiveWeapon, "pistol_revolver_t8");
            self addOpt("Give Strife", &BO4GiveWeapon, "pistol_standard_t8");
            self addOpt("Give Welling", &BO4GiveWeapon, "pistol_topbreak_t8");

            self addOpt("^0 == Shotguns ==");
            self addOpt("Give Mog 12", &BO4GiveWeapon, "shotgun_pump_t8");
            self addOpt("Give SG12", &BO4GiveWeapon, "shotgun_pump_t8");
            self addOpt("Give Trenchgun", &BO4GiveWeapon, "shotgun_pump_t8");

            self addOpt("^0 == Specials ==");
            self addOpt("Give Hellion Salvo", &BO4GiveWeapon, "launcher_standard_t8");
            self addOpt("Give Minigun", &BO4GiveWeapon, "minigun");
        break; 

        case "Powerups Menu":
            self addMenu(menu, "Powerups");
            if(BO4GetMap() == "Blood"){self addOpt("Zombie Blood", &GivePowerup, "zombie_blood");}
            self addOpt("Max Ammo", &GivePowerup, "full_ammo");
            self addOpt("Fire Sale", &GivePowerup, "fire_sale");
            self addOpt("Bonus Points", &GivePowerup, "bonus_points_player");
            self addOpt("Free Perk", &GivePowerup, "free_perk");
            self addOpt("Nuke", &GivePowerup, "nuke");
            self addOpt("Hero Weapon", &GivePowerup, "hero_weapon_power");
            self addOpt("Insta kill", &GivePowerup, "insta_kill");
            self addOpt("Double Points", &GivePowerup, "double_points");
            self addOpt("Carpenter", &GivePowerup, "carpenter");
            break;

        case "Zombie Menu":
            self addMenu(menu, "Zombie Menu");
            self addOpt("Kill All Zombies", &KillAllZombies, player);
            self addOpt("Teleport Zombies", &TeleportZombies);
            self addOptBool(self.FloatingZombies, "Floating Zombies", &FloatingZombies);
            self addOptBool(self.ZombiePos, "Spawn Zombies In Front Of You", &StartZombiePosistion);
        break;

        case "Mystery Box Menu":
            self addMenu(menu, "Mystery Box");
            self addOpt("Price", &newMenu, "Price Menu");
            self addOpt("Teleport To Chest", &TpToChest);
            self addOpt("Freeze Box Position", &BO4FreezeBox);
            self addOpt("Show All Mystery Boxes", &ShowAllBoxes);
        break;

        case "Price Menu":
            self addMenu(menu, "Price Menu");
            self addOpt("Default Box Price", &BoxPrice, 950);
            self addOpt("Free Box Price", &BoxPrice, 0);
            self addOpt("10 Box Price", &BoxPrice, 10);
            self addOpt("69 Box Price", &BoxPrice, 69);
            self addOpt("420 Box Price", &BoxPrice, 420);
            self addOpt("-1000 Box Price", &BoxPrice, -1000);
            self addOpt("Random Box Price", &BoxPrice, randomIntRange(0, 999999));
        break;

        case "Account Menu":
            self addMenu(menu,"Account Menu");
            self addOpt("Max Level", &BO4Level55, player);
            self addOpt("Prestige Selector", &newMenu, "Prestige");
            self addOptBool(player.PlasmaLoop, "Plasma Loop", &PlasmaLoopplayer, player);
            self addOpt("Unlock All", &bo4_UnlockAll, player);
            self addOpt("Complete Active Contracts", &CompleteActiveContracts, player);
            self addOpt("Max Weapon Levels", &bo4_MaxLevels, player);
            self addOpt("Give Level 1000", &BO4SetPrestigeMax);
            self addOpt("Give Achievements", &Achievements, player);
            self addOpt("Stats Menu", &newMenu, "Stats Menu");
        break;
        case "Prestige":
            self addMenu(menu, "Prestige Selector");
            for(i=0;i<12;i++)
                self addOpt("Prestige "+i, &BO4SetPrestige, i);
        break;
        case "Stats Menu":
            self addMenu(menu,"Stats Menu");
            self addOptIncSlider("Total Played", &Stats_TotalPlayed, 0, 0, 10000, 100);
            self addOptIncSlider("Highest Reached", &Stats_HighestReached, 0, 0, 10000, 100);
            self addOptIncSlider("Most Kills", &Stats_MostKills, 0, 0, 10000, 100);
            self addOptIncSlider("Most Headshots", &Stats_MostHeadshots, 0, 0, 10000, 100);
            self addOptIncSlider("Round", &Stats_Round, 0, 0, 10000, 100);
        break;

        case "Options":
            altSubs = StrTok("Personal Menu, Account Menu", ",");
            
            self addMenu(menu, "[" + player.playerSetting["verification"] + "]" + player getName());
                self addOpt("Verification", &newMenu, "Verification " + player GetEntityNumber());
                self addOpt("Personal Mods", &newMenu, "ClientPMods " + player GetEntityNumber());
                self addOpt("Client Stat Manipulation", &newMenu, "ClientStats " + player GetEntityNumber());
                self addOpt("Trolling Options", &newMenu, "Trolling " + player GetEntityNumber());
            break;
        case "Verification":
            self addMenu(menu, "Verification");
                for(a=0;a<(level.MenuStatus.size - 2);a++)
                    self addOptBool(player getVerification() == a, level.MenuStatus[a], &setVerification, a, player, true);
            break;
        case "ClientPMods":
            self addMenu(menu, "Personal Modifications");
                self addOptBool(player.godmode, "God Mode", &ClientHandler, "GodMode", player);
                self addOptBool(player.UnlimitedAmmo, "Unlimited Ammo", &ClientHandler, "Ammo", player);
                self addOpt("Give All Perks", &ClientHandler, "Perks", player);
                self addOpt("Give Self Revive", &ClientHandler, "SelfRev", player);
                self addOpt("Teleport To Player", &TeleTo, "them",player);
                self addOpt("Tele Player To Me", &TeleTo, "me",player);
                self addOpt("Max Out Player Score", &ClientHandler, "Score", player);
                if (BO4GetMap() == "Blood"){self addOpt("Give Player Blundergat", &ClientHandler, "BG", player); self addOpt("Give Player Magmagat", &ClientHandler, "MG", player); self addOpt("Give AcidGat", &ClientHandler, "AG", player);}
        break;
        case "ClientStats":
            self addMenu(menu, "Stat Manipulation");
                self addOpt("Give Max Level", &ClientHandler, "MaxLevel", player);
                self addOpt("Prestige Selector", &newMenu, "CPrestige " + player getEntityNumber());
                self addOptBool(player.PlasmaLoop2, "Plasma Loop 100k", &ClientHandler, "Plasma", player);
                self addOpt("Max Weapon Levels", &ClientHandler, "WeaponLevels", player);
                self addOpt("Unlock All", &ClientHandler, "UnlockAll", player);
                self addOpt("Set Prestige Master 1000", &ClientHandler, "1000", player);
        break;
        case "CPrestige":
            self addMenu(menu, "Client Prestige Selector");
                for(i=0;i<12;i++)
                    self addOpt("Prestige: "+i, &ClientPrestige, i, player);
        break;
        case "Trolling":
            self addMenu(menu, "Trolling Options");
                self addOpt("Take all Weapons", &TakeAllPlayerWeaps, player);
                self addOpt("Take All Player Score", &ClientHandler, "TakePoints", player);
                self addOpt("Send To Jail", &sendToJail, player);
                self addOpt("Kill Player", &KillPlayer, player);
                self addOpt("Down Player", &DownPlayer, player);
                self addOpt("Derank Player");
                self addOptIncSlider("Send Message", &PlayerMessage, 0,0,4,1, player);
            break;
        default:
            self addMenu(menu, "404 ERROR");
                self addOpt("Page Not Found");
            break;
    }
}

menuMonitor()
{
    self endon(#"disconnect");
    
    while(true)
    {
        if(self getVerification() > 0)
        {
            if(!self isInMenu())
            {
                if(self AdsButtonPressed() && self MeleeButtonPressed() && !isDefined(self.menu["DisableMenuControls"]))
                {
                    if(isDefined(self.menu["currentMenu"]) && self.menu["currentMenu"] != "")
                        menu = self.menu["currentMenu"];
                    else
                        menu = "Main";
                    
                    self openMenu1(menu);
                    wait .25;
                }
            }
            else if(self isInMenu() && !isDefined(self.menu["DisableMenuControls"]))
            {
                if(self AdsButtonPressed() || self AttackButtonPressed())
                {
                    if(!self AdsButtonPressed() || !self AttackButtonPressed())
                    {
                        curs = self getCursor();
                        menu = self getCurrent();
                        
                        self.menu["curs"][menu] += self AttackButtonPressed();
                        self.menu["curs"][menu] -= self AdsButtonPressed();
                        
                        arry = self.menu["items"][self getCurrent()].name;
                        curs = self getCursor();

                        if(curs < 0 || curs > (arry.size - 1))
                            self setCursor((curs < 0) ? (arry.size - 1) : 0);

                        self drawText();
                        wait .13;
                    }
                }
                else if(self UseButtonPressed() & 1)
                {
                    menu = self getCurrent();
                    curs = self getCursor();
                    
                    if(isDefined(self.menu["items"][menu].func[curs]))
                    {
                        if(isDefined(self.menu["items"][menu].slider[curs]) || isDefined(self.menu["items"][menu].incslider[curs]))
                            self thread ExecuteFunction(self.menu["items"][menu].func[curs], isDefined(self.menu["items"][menu].slider[curs]) ? self.menu_S[menu][curs][self.menu_SS[menu][curs]] : int(self.menu_SS[menu][curs]), self.menu["items"][menu].input1[curs], self.menu["items"][menu].input2[curs], self.menu["items"][menu].input3[curs], self.menu["items"][menu].input4[curs]);
                        else
                            self thread ExecuteFunction(self.menu["items"][menu].func[curs], self.menu["items"][menu].input1[curs], self.menu["items"][menu].input2[curs], self.menu["items"][menu].input3[curs], self.menu["items"][menu].input4[curs]);
                        if(isDefined(isDefined(self.menu["items"][menu].bool[curs])))
                            self RefreshMenu();
                        wait .15;
                    }
                }
                else if(self SecondaryOffhandButtonPressed() || self FragButtonPressed())
                {
                    if(!self SecondaryOffhandButtonPressed() || !self FragButtonPressed())
                    {
                        menu = self getCurrent();
                        curs = self getCursor();
                        
                        if(isDefined(self.menu["items"][menu].slider[curs]) || isDefined(self.menu["items"][menu].incslider[curs]))
                        {
                            inc = isDefined(self.menu["items"][menu].incslider[curs]) ? self.menu["items"][menu].intincrement[curs] : 1;
                            self.menu_SS[menu][curs] += self FragButtonPressed() ? inc : (inc * -1);
                            
                            if(isDefined(self.menu["items"][menu].slider[curs]))
                                self SetSlider(self.menu_SS[menu][curs]);
                            else
                                self SetIncSlider(self.menu_SS[menu][curs]);
                            self RefreshMenu();
                            wait .15;
                        }
                    }
                }
                else if(self MeleeButtonPressed())
                {
                    if(self getCurrent() == "Main")
                        self closeMenu1();
                    else
                        self newMenu();
                    wait .2;
                }
            }
        }
        wait .05;
    }
}

ExecuteFunction(function, i1, i2, i3, i4, i5, i6)
{
    if(!isDefined(function))
        return;
    
    if(isDefined(i6))
        return self thread [[ function ]](i1, i2, i3, i4, i5, i6);
    if(isDefined(i5))
        return self thread [[ function ]](i1, i2, i3, i4, i5);
    if(isDefined(i4))
        return self thread [[ function ]](i1, i2, i3, i4);
    if(isDefined(i3))
        return self thread [[ function ]](i1, i2, i3);
    if(isDefined(i2))
        return self thread [[ function ]](i1, i2);
    if(isDefined(i1))
        return self thread [[ function ]](i1);
    
    return self thread [[ function ]]();
}

drawText()
{
    self endon("menuClosed");
    self endon(#"disconnect");
    
    if(!isDefined(self.menu["curs"][self getCurrent()]))
        self.menu["curs"][self getCurrent()] = 0;
    
    menu = self getCurrent();
    text = self.menu["items"][self getCurrent()].name;
    curs = self getCursor();
    start = 0;

    if(curs > 3 && curs < (text.size - 4) && text.size > 8)
        start = curs - 3;
    if(curs > (text.size - 5) && text.size > 8)
        start = text.size - 8;
    
    if(text.size > 0)
    {
        if(isDefined(self.menu["items"][menu].title))
            self iPrintln("^4[ " + self.menu["items"][menu].title + " ]");
        self.lastRefresh = getTime();

        numOpts = text.size;
        if(numOpts >= 8)
            numOpts = 8;
        
        for(a=0;a<numOpts;a++)
        {
            text = self.menu["items"][menu].name;
            str = text[(a + start)];
            if(isDefined(self.menu["items"][menu].bool[(a + start)]))
                str += (isDefined(self.menu_B[menu][(a + start)]) && self.menu_B[menu][(a + start)]) ? " [ON]" : " [OFF]";
            else if(isDefined(self.menu["items"][menu].incslider[(a + start)]))
                str += "^1 < " + self.menu_SS[menu][(a + start)] + " >";
            else if(isDefined(self.menu["items"][menu].slider[(a + start)]))
                str += " < " + self.menu_S[menu][(a + start)][self.menu_SS[menu][(a + start)]] + " >";
            
            if(curs == (a + start))
                self iPrintln("^2   -> " + str + " ^0<-");
            else
                self iPrintln("^." + str);
        }

        if(numOpts < 9)
        {
            printSize = 8 - numOpts;
            for(a=0;a<printSize;a++)
                self iPrintln(".");
        }
    }
}

RefreshMenu()
{
    if(self hasMenu() && self isInMenu())
    {
        self runMenuIndex(self getCurrent());
        self drawText();
    }
}

openMenu1(menu)
{
    if(!isDefined(menu))
        menu = "Main";
    if(!isDefined(self.menu["curs"][menu]))
        self.menu["curs"][menu] = 0;
    
    self.menu["currentMenu"] = menu;
    self runMenuIndex(menu);
    self.playerSetting["isInMenu"] = true;
    self thread MonitorMenuRefresh();
}

MonitorMenuRefresh()
{
    self endon(#"disconnect");
    self endon("menuClosed");

    if(self isInMenu())
    {
        self drawText();
        while(self isInMenu())
        {
            if(self.lastRefresh < GetTime() - 7000)
                self drawText();
            wait 1;
        }
    }
}

closeMenu1()
{
    self DestroyOpts();
    self notify("menuClosed");
    self.playerSetting["isInMenu"] = undefined;
}

DestroyOpts()
{
    for(a=0;a<9;a++)
        self iPrintln(".");
}
