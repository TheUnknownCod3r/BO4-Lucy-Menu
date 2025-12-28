runMenuIndex(menu)
{
    self endon("disconnect");

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
                self addOpt("Account Menu", &newMenu, "Rank Menu");
                self addOpt("Teleport Menu", &newMenu, "Teleport Menu");
                if(self getVerification() > 1)
                {
                    self addOpt("Elixir Menu", &newMenu, "Elixir Menu");
                    self addOpt("Weapons and items Menu", &newMenu, "Weapons and items Menu");
                    self addOpt("Specialist Menu", &newMenu, "Specialist Menu");
                    self addOpt("Powerups Menu", &newMenu, "Powerups Menu");
                    self addOpt("Zombie Menu", &newMenu, "Zombie Menu");
                    if(self getVerification() > 2)
                    {
                        self addOpt("Lobby Settings", &newMenu, "Lobby Settings");
                        self addOpt("Mystery Box Menu", &newMenu, "Mystery Box Menu");
                        if(self getVerification() > 3)
                        {
                            if(self IsHost())
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
        case "Personal Menu":
            self addMenu(menu, "Personal Menu");
                self addOptBool(self.godmode, "God Mode", &Godmode);
                self addOptBool(self.demiMode, "Demi-God Mode", &DemiGod);
                self addOptBool(self.betterUnlimitedAmmo,"Unlimited Ammo", &BetterUnlimitedAmmo);
                self addOptBool(self.Noclip, "No Clip", &NoclipToggle1, self);
                self addOptBool(self.recoil, "No Recoil", &ToggleRecoil);
                self addOptBool(self.UnlimitedSprint, "Unlimited Sprint", &UnlimitedSprint);
                self addOptBool(self.PSpeed, "x2 Speed", &PSpeed);
                self addOptBool(self.killAura, "Kill Aura", &ToggleKillAura);//fixed 22/10/25 theunknowncod3r
                self addOpt("Award Self Res", &GetSelfRes);
                self addOpt("Revive Yourself", &BO4Rev);
                self addOpt("All Perks", &GiveAllPerks);
                self addOpt("Perk Selection", &newMenu, "Perk Selection");
                self addOpt("Score Menu", &newMenu, "Score Menu");
                self addOpt("Open All Doors", &BO4_OpenAllDoors);
        break;
        case "Perk Selection":
            self addMenu(menu, "Perk Selection");
            self addOpt("Modifier Menu", &newMenu, "Modifiers");
                for(i = 0; i < level._PerkStrings.size; i++)
                    self addOpt(level._PerkNames[i], &GivePlayerPerk, level._PerkStrings[i], self);
        break;
        case "Score Menu":
            self addMenu(menu, "Score");
                self addOptBool(self.onlyIncrease, "Score Only Increases", &ScoreOnlyIncreases);
                self addOpt("Max Points", &PlayerGiveScore, 4000000);
                self addOpt("Take Points", &PlayerTakeScore, 4000000);
                self addOptIncSlider("Add Points", &PlayerGiveScore, 0, 0, 1000000, 10000);
                self addOptIncSlider("Take Points", &PlayerTakeScore, 0, 0, 1000000, 10000);
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
            self addMenu(menu, "Mega Elixirs");
            for(i = 0; i < level._MegaElixirs.size; i++)
                self addOpt(constructString(replaceChar(level._MegaElixirs[i], "_", " ")), &GiveElixir, level._MegaTypes[i], "zm_bgb_" + level._MegaElixirs[i]);
        break;

        case "Legendary Elixirs":
            self addMenu(menu, "Legendary Elixirs");
            for(i = 0; i < level._LegendaryElixirs.size; i++)
                self addOpt(constructString(replaceChar(level._LegendaryElixirs[i], "_", " ")), &GiveElixir, level._LegendaryTypes[i], "zm_bgb_" + level._LegendaryElixirs[i]);
        break;

        case "Rare Elixirs":
            self addMenu(menu, "Rare Elixirs");
            for(i = 0; i < level._RareElixirs.size; i++)
                self addOpt(constructString(replaceChar(level._RareElixirs[i], "_", " ")), &GiveElixir, level._RareTypes[i], "zm_bgb_" + level._RareElixirs[i]);
        break;

        case "Common Elixirs":
            self addMenu(menu, "Common Elixirs");
            for(i = 0; i < level._CommonElixirs.size; i++)
                self addOpt(constructString(replaceChar(level._CommonElixirs[i], "_", " ")), &GiveElixir, level._CommonTypes[i], "zm_bgb_" + level._CommonElixirs[i]);
        break;

        case "Classic Elixirs":
            self addMenu(menu, "Classic Elixirs");
            for(i = 0; i < level._ClassicElixirs.size; i++)
                self addOpt(constructString(replaceChar(level._ClassicElixirs[i], "_", " ")), &GiveElixir, level._ClassicTypes[i], "zm_bgb_" + level._ClassicElixirs[i]);
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
            switch(BO4GetMap()){
                case "IX": 
                    self addOpt("Zeus Perk Machine", &BO4newOrigin, (1993.89, -479.343, 212.125), "Zeus Perk Machine");
                    self addOpt("Odin Perk Machine", &BO4newOrigin, (2020.7, 341.974, 215.125), "Odin Perk Machine");
                    self addOpt("Ra Perk Machine", &BO4newOrigin, (-1809.33, 423.894, 212.125), "Ra Perk Machine");
                    self addOpt("Danu Perk Machine", &BO4newOrigin, (-1922.34, -443, 216.313), "Danu Perk Machine");
                    self addOpt("Challenge Podium", &BO4newOrigin, (58.3157, -24.4512, 80.125), "Challenge Podium");
                    self addOpt("The Pit", &BO4newOrigin, (151.776, 1802.6, -365.875), "The Pit");
                    break;
                case "Blood":
                    self addOpt("Richtofen's Lab", &BO4newOrigin, (9953.67, 11261.1, 256.125), "Richtofen's Lab");
                    self addOpt("West Grounds", &BO4newOrigin, (8661.22, 10287.5, 513.077), "West Grounds");
                    self addOpt("Power Switch One", &BO4newOrigin, (8892.1, 8851.01, 423.469), "Power Switch One");
                    self addOpt("New Industries", &BO4newOrigin, (7083.19, 11134.6, 311.625), "New Industries");
                    self addOpt("Recreation Yard", &BO4newOrigin, (4836.18, 10932.7, 1016.13), "Recreation Yard");
                    self addOpt("Cafeteria", &BO4newOrigin, (2589.46, 9645.69, 1336.13), "Cafeteria");
                    self addOpt("2nd Floor Cell Block", &BO4newOrigin, (869.781, 9690.19, 1443.13), "2nd Floor Cell Block");
                    self addOpt("Wardens Office", &BO4newOrigin, (-588.591, 8613.38, 1336.13), "Wardens Office");
                    self addOpt("Wardens House", &BO4newOrigin, (-2382.56, 7745.07, 1304.13), "Wardens House");
                    self addOpt("Citadel Tunnels", &BO4newOrigin, (420.385,9506.33,1104.13), "Citadel Tunnels");
                    self addOpt("Building 64 Powerhouse", &BO4newOrigin, (-1037.37, 6576.8, 70.1152), "Building 64 Powerhouse");
                    self addOpt("Docks", &BO4newOrigin, (-543.102, 5451.18, -71.875), "Docks");
                    self addOpt("Prison Roof", &BO4newOrigin, (3467.25, 9740.63, 1704.13), "Prison Roof");
                    break;
                case "Voyage":
                    self addOpt("Poop Deck", &BO4newOrigin, (6.67061, 4843.74, 1216.12), "Poop Deck");
                    self addOpt("Boiler Room", &BO4newOrigin, (8.88611, 622.069, 320.125), "Boiler Room");  
                    self addOpt("Dining Hall", &BO4newOrigin, (-457.054, -775.388, 1056.13), "Dining Hall");
                    self addOpt("1st Class Lounge", &BO4newOrigin, (-160.682, -612.253, 1216.13), "1st Class Lounge");
                    self addOpt("Forecastle", &BO4newOrigin, (118.374, -4506.12, 928.125), "Forecastle");
                    break;
                case "Classified":
                    self addOpt("Conference Room", &BO4newOrigin, (-911.255, 2531.01, 16.125), "Conference Room");
                    self addOpt("Main Offices", &BO4newOrigin, (333.581, 2069.82, 16.125), "Main Offices");
                    self addOpt("War Room Upper Level", &BO4newOrigin, (-1468.32, 2040.02, -303.875), "War Room Upper Level");
                    self addOpt("War Room Lower Level", &BO4newOrigin, (-317.895, 2114.2, -511.875), "War Room Lower Level");
                    self addOpt("Laboratories", &BO4newOrigin, (333.581, 2069.82, 16.125), "Laboratories");
                    break;
                case "Dead":
                    self addOpt("Sentinel Artifact", &BO4newOrigin, (-2.56008, -928.784, -7.875), "Sentinel Artifact");
                    self addOpt("North Atrium Bridge", &BO4newOrigin, (11.2006, 956.359, 25.7624), "North Atrium Bridge");
                    self addOpt("Bedroom", &BO4newOrigin, (1727.24, 1165.29, -7.875), "Bedroom");
                    self addOpt("Wine Cellar", &BO4newOrigin, (-249.745, -1334.12, -415.875), "Wine Cellar");
                    self addOpt("Mausoleum", &BO4newOrigin, (-4474.56, 524.39, 272.125), "Mausoleum");
                    self addOpt("Library", &BO4newOrigin, (-1512.27, 485.992, -209.684), "Library");
                    self addOpt("Greenhouse Laboratories", &BO4newOrigin, (4356.48, -73.3307, -439.875), "Greenhouse Laboratories");
                    self addOpt("Forest", &BO4newOrigin, (-13.9522, 5562.84, -783.936), "Forest");
                    break;
                case "AE":
                    self addOpt("Temple of Apollo", &BO4newOrigin, (-786.167, -867.222, 64.125), "Temple of Apollo");
                    self addOpt("Amphitheater", &BO4newOrigin, (-1990.29, 1212.24, 252.125), "Amphitheater");
                    self addOpt("Spartan Monument", &BO4newOrigin, (803.154, -4110.64, -815.908), "Spartan Monument");
                    self addOpt("River of Sorrow", &BO4newOrigin, (-1220.23, 6305.58, 946.825), "River of Sorrow");
                    self addOpt("Cliff Ruins", &BO4newOrigin, (-2715.52, 7363.74, 527.862), "Cliff Ruins");
                    self addOpt("Python Pass", &BO4newOrigin, (202.279, 8547.08, 434.117), "Python Pass");
                    break;
                case "AO":
                    self addOpt("Security Checkpoint", &BO4newOrigin, (68.2689, -3217.63, 65.625), "Security Checkpoint");
                    self addOpt("Rushmore", &BO4newOrigin, (1024.37, -2085.02, -39.875), "Rushmore");
                    self addOpt("APD Interrogation", &BO4newOrigin, (-924.275, -1822.22, -50.875), "APD Interrogation");
                    self addOpt("Cul-De-Sac", &BO4newOrigin, (-92.3641, 648.275, -61.125), "Cul-De-Sac");
                    self addOpt("Greenhouse", &BO4newOrigin, (-1178.23, 737.475, 78.125), "Greenhouse");
                    self addOpt("Yellowhouse", &BO4newOrigin, (1201.23, 309.127, 77.125), "Yelowhouse");
                    self addOpt("Beds", &BO4newOrigin, (-40.4824, 1132.1, -415.875), "Beds");
                    self addOpt("APD Control", &BO4newOrigin, (-160.155, -2061.96, -231.875), "APD Control");
                    break;
                case "Tag":
                    self addOpt("Docks", &BO4newOrigin, (1382.79, 3483.08, 26.625), "Docks");
                    self addOpt("Lagoon", &BO4newOrigin, (1838.13, 618.756, 7.74777), "Lagoon");
                    self addOpt("Lighthouse Cove", &BO4newOrigin, (36.2677, 646.928, 134.026), "Lighthouse Cove");
                    self addOpt("Lighthouse Top", &BO4newOrigin, (133.577, 1406.61, 864.125), "Lighthouse Top");
                    self addOpt("Cave", &BO4newOrigin, (-2008.52, 1986.8, 167.866), "Cave");
                    self addOpt("Sun Deck", &BO4newOrigin, (-626.267, -1333.58, 637.176), "Sun Deck");
                    self addOpt("Forecastle", &BO4newOrigin, (2274.94, -2836.93, 315.773), "Forecastle");
                    self addOpt("Campfire", &BO4newOrigin, (2299.56, -690.696, 5.1327), "Campfire");
                    self addOpt("Human Infusion", &BO4newOrigin, (-3298.49, 4215.59, 1176.13), "Human Infusion");
                    self addOpt("Secret :D", &BO4newOrigin, (-7432.51, -24841.3, 13.5001), "Secret :D");
                    break;
            }
        break;
        case "Fun Menu":
            self addMenu(menu, "Fun Menu");
            self addOpt("Clone", &Clone);
	        self addOpt("HUDDisable", &HUDDisable);    
            self addOptBool(self.thirdperson, "Third Person", &thirdperson);
            self addOpt("Play EE Song", &PlayEESong);
            self addOpt("Play EE 2 Song", &PlayEE2Song);
            self addOptBool(self.aimbot, "Aimbot", &bo4_toggleaimbot);
            self addOptBool(self.TeleGun, "Teleport Gun", &StartTeleGun);
            self addOptBool(self.HideWeapon, "Hide Gun", &HideGun);
            self addOptBool(self.Multijump, "Multi Jump", &Multijump);
            self addOptBool(self.FloatingZombies, "Floating Zombies", &FloatingZombies);
            self addOptBool(self.ForcingTheHost, "Force Host", &ForceHostToggle); 
            self addOpt("Spawn Luna Wolf", &LunaWolf);   
            self addOpt("Save Location", &SaveLocation, 0);
            self addOpt("Load Location", &SaveLocation, 1);
        break;
        case "Lobby Settings":
            self addMenu(menu, "Lobby Settings");
                self addOptBool(level.BO4NoFallD, "No Fall", &BO4NoFallDam);
                self addOptBool(level.SuperJump, "Super Jump", &SuperJump);
                self addOptBool(level.SuperSpeed, "Super Speed", &SuperSpeed); 
                self addoptBool(level.B4Gravity, "Low Gravity", &B4Gravity);
                self addOpt("Add Bot", &bo4_AddBotsToGame);
                self addOptBool(self.AntiQuit, "Anti Quit", &AntiQuit);
                self addOpt("Anti Join", &AntiJoin);
        break;
        case "Weapons and items Menu":
            self addMenu(menu, "Weapon Menu");
            self addOpt("Normal Weapons and items", &newMenu, "Normal Weapons and items");
            //self addOpt("Weaps Test", &newMenu, "Weaps Test");
            self addOpt("Upgraded Weapons", &newMenu, "Upgraded Weapons");
            self addOpt("Bullet Effects Menu", &newMenu, "Bullets Menu");
            self addOpt("Camo Selector", &newMenu, "Camo Selector");
            self addOpt("Upgrade Weapon", &UpgradeWeapon);
            self addOpt("Pack a Punch Effects", &newMenu, "Pack a Punch Effects");
            self addOpt("Drop Weapon", &DropWeapon);
            self addOpt("Take All Weapons", &TakeWeapons);
            self addOpt("Take Current Weapon", &TakeCurrentWeapon);
            break;
        case "Specialist Menu":
        self addMenu(menu, "Specialist Menu");
            switch(BO4GetMap())
            {
                case "Blood":
                case "Classified":
                case "AO":
                case "Tag":
                    self addOpt("Flamethrower", &GiveClientWeapon, "hero_flamethrower_t8_lv3", self);
                    self addOpt("Katana", &GiveClientWeapon, "hero_katana_t8_lv3", self);
                    self addOpt("Ragnaroks", &GiveClientWeapon, "hero_gravityspikes_t8_lv3", self);
                    self addOpt("Minigun", &GiveClientWeapon, "hero_minigun_t8_lv3", self);
                    break;

                case "Voyage":
                case "Dead":
                case "IX":
                case "AE":
                    self addOpt("Chakrams", &GiveClientWeapon, "hero_chakram_lv3", self);
                    self addOpt("Hammer", &GiveClientWeapon, "hero_hammer_lv3", self);
                    self addOpt("Scepter", &GiveClientWeapon, "hero_scepter_lv3", self);
                    self addOpt("Viper and Dragon", &GiveClientWeapon, "hero_sword_pistol_lv3", self);
                    break;
            }
        break;    
        case "Bullets Menu":
        self addMenu(menu, "Bullets Menu");
            self addOptBool(self.magicBullets, "Toggle Magic Bullets", &magicbullets);
            self addOpt("Minigun", &changeBulletType, 0);
            self addOpt("Ballistic Knife", &changeBulletType, 1);
            self addOpt("Hellion Salvo", &changeBulletType, 2);
            if(BO4GetMap() == "Blood" || BO4GetMap() == "AO" || BO4GetMap() == "Tag" || BO4GetMap() == "Classified"){
            self addOpt("Ray Gun", &changeBulletType, 3);
        }    
        break;
        case "Pack a Punch Effects":
            self addMenu(menu, "Pack a Punch Effects");
            self addOpt("Brain Rot", &acquireaat, "zm_aat_brain_decay");
            self addOpt("Fire Burst", &acquireaat, "zm_aat_plasmatic_burst");
            self addOpt("Kill o Watt", &acquireaat, "zm_aat_kill_o_watt");
            self addOpt("Cryofreeze", &acquireaat, "zm_aat_frostbite");
            self addOpt("Remove Effect", &RemoveEff);
        break;
        case "Camo Selector":
        self addMenu(menu, "Camo Selector");
            for(a=0;a<96;a++)
                    self addOpt("Camo: " + (a + 1), &bo4_CamoGiver, a);
        break;
        case "Normal Weapons and items":
            self addMenu(menu, "Normal Weapons");
            for(z=0;z<level._WeaponCategs.size;z++)
                self addOpt(level._WeaponCategs[z], &newMenu, level._WeaponCategs2[z]);
        break;
        case "Assault Rifles":
            self addMenu(menu, "Assault Rifles");
            for(t=0;t<level._AssaultNames.size;t++)
                self addOpt("Give "+level._AssaultNames[t], &GiveClientWeapon, level._AssaultStrings[t], self);
        break;
        case "SMG":
            self addMenu(menu, "Submachine Guns");
            for(t=0;t<level._SMGNames.size;t++)
                self addOpt("Give "+level._SMGNames[t], &GiveClientWeapon, level._SMGStrings[t], self);
        break;
        case "Tactical Rifles":
            self addMenu(menu, "Tactical Rifles");
            for(t=0;t<level._TacticalNames.size;t++)
                self addOpt("Give "+level._TacticalNames[t], &GiveClientWeapon, level._TacticalStrings[t], self);
        break;
        case "LMG":
            self addMenu(menu, "Light Machine Guns");
            for(t=0;t<level._LMGNames.size;t++)
                self addOpt("Give "+level._LMGNames[t], &GiveClientWeapon, level._LMGStrings[t], self);
        break;
        case "Sniper Rifles":
            self addMenu(menu, "Sniper Rifles");
            for(t=0;t<level._SniperNames.size;t++)
                self addOpt(level._SniperNames[t], &GiveClientWeapon, level._SniperStrings[t], self);
        break;
        case "Pistols":
            self addMenu(menu, "Pistols");
            for(t = 0; t < level._PistolStrings.size; t++)
                self addOpt("Give " + level._PistolNames[t], &GiveClientWeapon, level._PistolStrings[t], self);
        break;
        case "Shotguns":
            self addMenu(menu, "Shotguns");
            for(t = 0; t < level._ShotgunStrings.size; t++)
                self addOpt("Give " + level._ShotgunNames[t], &GiveClientWeapon, level._ShotgunStrings[t], self);
        break;
        case "Special Weapons":
            self addMenu(menu, "Special Weapons");
             for(t = 0; t < level._SpecialStrings.size; t++)
                self addOpt(level._SpecialNames[t], &GiveClientWeapon, level._SpecialStrings[t], self);
            switch(BO4GetMap())
            {
                case "Blood":
                case "AO":
                case "Tag":
                case "Classified": for(r=0;r<level._MapWeapsAether.size;r++) self addOpt(level._MapWeapsAether[r],&GiveClientWeapon,level._MapWeapsAether[r],self);
                    break;
                case "Voyage":
                case "Dead":
                case "IX":
                case "AE": self addOpt("Homunculus", &GiveClientWeapon, "homunculus", self);//Credit SirCryptic / Abomination Unofficial
                    break;
            }
        break;
        case "Map Specific Weapons and items":
            self addMenu(menu, "Map Specific Weapons and items");
            switch(BO4GetMap()){
                case "Voyage": for(t=0;t<level._VoyageWeapNames.size;t++)
                    self addOpt(level._VoyageWeapNames[t], &GiveClientWeapon,level._VoyageWeaps[t],self);
                    break;
                case "Blood": for(t=0;t<level._BloodWeaps.size;t++)
                    self addOpt(level._BloodWeapNames[t], &GiveClientWeapon, level._BloodWeaps[t],self);
                    break;
                case "IX": for(t=0;t<level._IXWeapNames.size;t++)
                    self addOpt(level._IXWeapNames[t], &GiveClientWeapon, level._IXWeaps[t], self);
                    break;
                case "Dead": for(t=0;t<level._DeadWeapNames.size;t++)
                    self addOpt(level._DeadWeapNames[t], &GiveClientWeapon, level._DeadWeaps[t], self);
                    break;
                case "AE": for(t=0;t<level._AEWeapNames.size;t++)
                    self addOpt(level._AEWeapNames[t], &GiveClientWeapon, level._AEWeaps[t], self);
                    break;
                case "Tag": for(t=0;t<level._TagWeapNames.size;t++)
                    self addOpt(level._TagWeapNames[t], &GiveClientWeapon, level._TagWeaps[t], self);
                    break;
                case "AO": for(t=0;t<level._AOWeapNames.size;t++)
                    self addOpt(level._AOWeapNames[t], &GiveClientWeapon, level._AOWeaps[t], self);
                    break;
                case "Classified": for(t=0;t<level._ClassWeapNames.size;t++)
                    self addOpt(level._ClassWeapNames[t], &GiveClientWeapon, level._ClassWeaps[t], self);
                    break;
            }
        break;
        case "Upgraded Weapons":
            self addMenu(menu, "Upgraded Weapons");
            for(t=0;t<level._WeaponCategs.size - 1;t++)
                self addOpt(level._WeaponCategs[t], &newMenu, level._WeaponCategs3[t]);
        break;
        case "Upgraded AR":
            self addMenu(menu, "Upgraded Assault Rifles");
            for(t=0;t<level._AssaultNames.size;t++)
                self addOpt("Give "+level._UpgAssaultNames[t], &GiveClientWeapon, level._AssaultStrings[t]+"_upgraded", self);
        break;
        case "Upgraded SMG":
            self addMenu(menu, "Upgraded SMGs");
            self addOpt("Nuevemuertes xx", &GiveClientWeapon, "smg_standard_t8_upgraded", self);
            self addOpt("Stellar 92", &GiveClientWeapon, "smg_handling_t8_upgraded", self);
            self addOpt("Sky Scorcher", &GiveClientWeapon, "smg_fastfire_t8_upgraded", self);
            self addOpt("Corpsemaker", &GiveClientWeapon, "smg_capacity_t8_upgraded", self);
            self addOpt("Ghoul Keepers Subjugator", &GiveClientWeapon, "smg_accurate_t8_upgraded", self);
            self addOpt("PieceDerResistance", &GiveClientWeapon, "smg_drum_pistol_t8_upgraded", self);
            self addOpt("Excisenin3fold", &GiveClientWeapon, "smg_folding_t8_upgraded", self);
            self addOpt("Unseen Vhand", &GiveClientWeapon, "smg_fastburst_t8_upgraded", self);
            self addOpt("The Dark Impaler", &GiveClientWeapon, "smg_vmp_t8_upgraded", self);
	        self addOpt("Infernal Mercy", &GiveClientWeapon, "smg_minigun_t8_upgraded", self);
            self addOpt("The Afterburner", &GiveClientWeapon, "smg_mp40_t8_upgraded", self);
            self addOpt("Speakeasy", &GiveClientWeapon, "smg_thompson_t8_upgraded", self);
        break;
        case "Upgraded TR":
            self addMenu(menu, "Upgraded Tactical Rifles");
            self addOpt("Dead Mans ReefRacker", &GiveClientWeapon, "tr_powersemi_t8_upgraded", self);
            self addOpt("Astralo-Packy-Cormus", &GiveClientWeapon, "tr_longburst_t8_upgraded", self);
            self addOpt("Br-r-rah", &GiveClientWeapon, "tr_midburst_t8_upgraded", self);
            self addOpt("Macho Manta VI", &GiveClientWeapon, "tr_flechette_t8_upgraded", self);
            self addOpt("Quatermaster's Reapeater", &GiveClientWeapon, "tr_leveraction_t8_upgraded", self);
            self addOpt("Skullpiercer", &GiveClientWeapon, "tr_damageburst_t8_upgraded", self);
        break;
        case "Upgraded LMG":
            self addMenu(menu, "Upgraded LMGs");
            self addOpt("Cackling Kaftar", &GiveClientWeapon, "lmg_heavy_t8_upgraded", self);
            self addOpt("Acheron Alliterator", &GiveClientWeapon, "lmg_spray_t8_upgraded", self);
            self addOpt("Tartarus Veil", &GiveClientWeapon, "lmg_standard_t8_upgraded", self);
            self addOpt("Sumarbrander", &GiveClientWeapon, "lmg_double_t8_upgraded", self);
            self addOpt("Smilomegladon", &GiveClientWeapon, "lmg_stealth_t8_upgraded", self);
        break;
        case "Upgraded SR":
            self addMenu(menu, "Upgraded Snipers");
            for(t=0;t<level._UpgSniperNames.size;t++)
                self addOpt(level._UpgSniperNames[t], &GiveClientWeapon, level._SniperStrings[t]+"_upgraded", self);
        break;
        case "Upgraded Pistols":
            self addMenu(menu, "Upgraded Pistols");
            self addOpt("Rapskallion 3D", &GiveClientWeapon, "pistol_burst_t8_upgraded", self);
            self addOpt("Belle Of The Ball", &GiveClientWeapon, "pistol_revolver_t8_upgraded", self);
            self addOpt("Z-Harmony", &GiveClientWeapon, "pistol_standard_t8_upgraded", self);
            self addOpt("King & Country", &GiveClientWeapon, "pistol_topbreak_t8_upgraded", self);
            self addOpt("IM-PAK-ED", &GiveClientWeapon, "pistol_fullauto_t8_upgraded", self);
        break;
        case "Upgraded Shotguns":
            self addMenu(menu, "Upgraded Shotguns");
            self addOpt("OMG Right Hook", &GiveClientWeapon, "shotgun_pump_t8_upgraded", self);
            self addOpt("Breccius Rebornus", &GiveClientWeapon, "shotgun_semiauto_t8_upgraded", self);
            self addOpt("M9-TKG Home Wrecker", &GiveClientWeapon, "shotgun_trenchgun_t8_upgraded", self);
            self addOpt("Surgical Havoc", &GiveClientWeapon, "shotgun_fullauto_t8_upgraded", self);
            self addOpt("Ancient Harbinger", &GiveClientWeapon, "shotgun_precision_t8_upgraded", self);
        break;
        case "Upgraded Specials":
            self addMenu(menu, "Upgraded Specials");
            self addOpt("Zitros Orbital Arbalest", &GiveClientWeapon, "launcher_standard_t8_upgraded", self);
            self addOpt("Thekrauss Refibrillator++", &GiveClientWeapon, "special_ballisticknife_t8_dw_upgraded", self);
            self addOpt("Minos's Zeal", &GiveClientWeapon, "special_crossbow_t8_upgraded", self);
            if(BO4GetMap() == "Blood" || BO4GetMap() == "AO" || BO4GetMap() == "Tag" || BO4GetMap() == "Classified"){
            self addOpt("Porters X2 Ray Gun", &GiveClientWeapon, "ray_gun_upgraded", self);
            self addOpt("Porters Mark II Ray Gun", &GiveClientWeapon, "ray_gun_mk2_upgraded", self);
           }
            if(BO4GetMap() == "Voyage"){
                self addOpt("Decayed Kraken", &GiveClientWeapon, "ww_tricannon_earth_t8_upgraded", self);
                self addOpt("Plasmatic Kraken", &GiveClientWeapon, "ww_tricannon_fire_t8_upgraded", self);
                self addOpt("Purified Kraken", &GiveClientWeapon, "ww_tricannon_water_t8_upgraded", self);
                self addOpt("Radiant Kraken", &GiveClientWeapon, "ww_tricannon_air_t8_upgraded", self);
                self addOpt("Upgraded Kraken", &GiveClientWeapon, "ww_tricannon_t8_upgraded", self);
		        self addOpt("Svalinn Guard", &GiveSvalinnGuard);
            }
            else if(BO4GetMap() == "Blood"){
                self addOpt("Magnus Operandi", &GiveClientWeapon, "ww_blundergat_fire_t8_upgraded", self);
                self addOpt("Vitriolic Withering", &GiveClientWeapon, "ww_blundergat_acid_t8_upgraded", self);
                self addOpt("The Sweeper", &GiveClientWeapon, "ww_blundergat_t8_upgraded", self);
                self addOpt("Hells Redeemer", &GiveClientWeapon, "tomahawk_t8_upgraded", self);
                self addOpt("Attuned Spectral Shield", &GiveClientWeapon, "zhield_spectral_dw_upgraded", self);
		self addOpt("Golden Spork Knife", &GiveClientWeapon, "spknifeork", self);
		self addOpt("Golden Scalpel", &GiveClientWeapon, "golden_knife", self);
                self addOpt("Tempered Blundergat", &GiveClientWeapon, "ww_blundergat_fire_t8_unfinished", self);
            }
            else if(BO4GetMap() == "AE"){
                self addOpt("Hand of Ouranous", &GiveClientWeapon, "ww_hand_o_upgraded", self);
                self addOpt("Hand of Hemera", &GiveClientWeapon, "ww_hand_h_upgraded", self);
                self addOpt("Hand of Gaia", &GiveClientWeapon, "ww_hand_g_upgraded", self);
                self addOpt("Hand of Charon", &GiveClientWeapon, "ww_hand_c_upgraded", self);
            }
            else if(BO4GetMap() == "Tag"){
                self addOpt("ZeusCannon", &GiveClientWeapon, "thundergun_upgraded", self);
                self addOpt("Wonderwaffe DG-3 JZ", &GiveClientWeapon, "ww_tesla_gun_t8_upgraded", self);
                self addOpt("Boreas Blizzard", &GiveClientWeapon, "tundragun_upgraded", self);
                self addOpt("Wunderwaffe DG-Funkenschutze", &GiveClientWeapon, "ww_tesla_sniper_upgraded_t8", self);//Correct stringname from Hashed scripts
		        self addOpt("Snowballs Upgraded", &GiveClientWeapon, "snowball_upgraded", self);
                self addOpt("Yellow Snowballs Upgraded", &GiveClientWeapon, "snowball_yellow_upgraded", self);
            }
            else if(BO4GetMap() == "AO"){
                self addOpt("Ray Gun II-V", &GiveClientWeapon, "ray_gun_mk2v_upgraded", self);
                self addOpt("Ray Gun II-X", &GiveClientWeapon, "ray_gun_mk2x_dw", self);
                self addOpt("Ray Gun II-Y", &GiveClientWeapon, "ray_gun_mk2y_upgraded", self);
                self addOpt("Ray Gun II-Z", &GiveClientWeapon, "ray_gun_mk2z_upgraded", self);
            }
            else if(BO4GetMap() == "Classified"){
                self addOpt("Winter's Fury", &GiveClientWeapon, "ww_freezegun_t8_upgraded", self);
            }
            else if(BO4GetMap() == "IX"){
                self addOpt("Serket Kiss", &GiveClientWeapon, "ww_crossbow_t8_upgraded", self);
                self addOpt("Iron Bull", &GiveClientWeapon, "zhield_zword_dw_upgraded", self);
            }   
            else if(BO4GetMap() == "Dead"){
                self addOpt("Chaos Theory", &GiveClientWeapon, "ww_random_ray_gun2", self);
                self addOpt("Alistairs Annihilator", &GiveClientWeapon, "ww_random_ray_gun3", self);
            }   
        break;
        case "Powerups Menu":
            self addMenu(menu, "Powerups");
            if(BO4GetMap() == "Blood"){self addOpt("Zombie Blood", &GivePowerup, "zombie_blood");}
            for(t = 0; t < level._PowerupStrings.size; t++)
                self addOpt(constructString(replaceChar(level._PowerupStrings[t], "_", " ")), &GivePowerup, level._PowerupStrings[t]);
            break;

        case "Zombie Menu":
            self addMenu(menu, "Zombie Menu");
            self addOpt("Kill All Zombies", &KillAllZombies);
            self addOptIncSlider("Edit Round: ", &RoundEdit, 0, 0, 9999, 1);
            self addOptBool(self.ZombiePos, "Teleport to Crosshair Loop", &StartZombiePosistion);
            self addOptBool(self.NoTarg, "No Target", &notarget);
            self addOptBool(self.personal_instakill, "Insta Kill", &selfInstaKill);
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

        case "Rank Menu":
            self addMenu(menu,"Rank Menu");
            self addOpt("Max Level", &BO4Level55, self);
            self addOpt("Level 1000", &BO4Level1000, self);
            self addOptBool(self.PlasmaLoop, "Plasma Loop", &PlasmaLoopplayer, self);
            self addOpt("Complete Active Contracts", &CompleteActiveContracts, self);
            self addOpt("Unlock All", &bo4_UnlockAll, self);
            self addOpt("Max Weapon Levels", &bo4_MaxLevels, self);
            self addOpt("Give Achievements", &Achievements, self);
            self addOpt("Stats Menu", &newMenu, "Stats Menu");
        break;
        case "Stats Menu":
            self addMenu(menu,"Stats Menu");
            for(t=0;t<level._StatOpts.size;t++)
                self addOptIncSlider(level._StatOpts[t], &StatEditor, 0,0,10000,100,t);
        break;
        case "AllClient":
            self addMenu(menu, "All Client Options");
                self addOpt("All God Mode", &ClientFuncs, 0, undefined);
                self addOpt("All Unlimited Ammo", &ClientFuncs, 1, undefined);
                self addOpt("All Max Points", &ClientFuncs, 2, undefined);
                self addOpt("Give Everyone All Perks", &ClientFuncs, 3, undefined);
                self addOptIncSlider("Self Revives", &SetSelfRevives, 0, 0, 125, 5);
        break;
        case "GameModes":
            self addMenu(menu, "Game Modes");
                self addOpt("All The Weapons", &GameModeHandler, "All The Weapons");
                self addOpt("Gun Game", &GameModeHandler, "Gun Game");
        break;
        case "Host Menu":
            self addMenu(menu, "Host Menu");
                self addOptBool(level.Modvars, "Toggle ModVars", &ModvarTest);
                self addOpt("Map Selection", &newMenu, "Map Selection");
                self addOpt("Safe end Game (Stats)", &SafeEndGame);
                self addOpt("Exit Level (No Stats)", &PlayerExitLevel);
                self addOptIncSlider("Set XP Rate", &SetCustomXPMultiplier,0,0,100,1);
                self addOpt("Activate PAP", &ActivatePAP);
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
    self endon("disconnect");
    
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
        case "Options":       
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
                self addOptBool(player.godmode, "God Mode", &ClientHandler, 0, player);
                self addOptBool(player.betterUnlimitedAmmo, "Unlimited Ammo", &ClientHandler, 1, player);
                self addOpt("Give All Perks", &ClientHandler, 4, player);
                self addOpt("Give Self Revive", &ClientHandler, 5, player);
                self addOpt("Teleport To Player", &TeleTo, 1,player);
                self addOpt("Tele Player To Me", &TeleTo, 0,player);
                self addOpt("Max Out Player Score", &ClientHandler, 8, player);
                if (BO4GetMap() == "Blood"){self addOpt("Give Player Blundergat", &GiveClientWeapon, "ww_blundergat_t8", player); self addOpt("Give Player Magmagat", &GiveClientWeapon, "ww_blundergat_fire_t8", player); self addOpt("Give AcidGat", &GiveClientWeapon, "ww_blundergat_acid_t8", player);}
        break;
        case "ClientStats":
            self addMenu(menu, "Stat Manipulation");
                self addOpt("Give Max Level", &ClientHandler, 2, player);
                self addOptBool(player.PlasmaLoop2, "Plasma Loop 100k", &ClientHandler, 3, player);
                self addOpt("Max Weapon Levels", &ClientHandler, 7, player);
                self addOpt("Unlock All", &ClientHandler, 6, player);
        break;
        case "Trolling":
            self addMenu(menu, "Trolling Options");
                self addOpt("Take all Weapons", &TakeAllPlayerWeaps, player);
                self addOpt("Take All Player Score", &ClientHandler, 9, player);
                self addOpt("Send To Jail", &sendToJail, player);
                self addOpt("Kill Player", &KillPlayer, player);
                self addOpt("Down Player", &DownPlayer, player);
                self addOptIncSlider("Send Message", &PlayerMessage, 0,0,21,1, player);
            break;
        default:
            self addMenu(menu, "404 ERROR");
                self addOpt("Page Not Found");
            break;
    }
}

menuMonitor()
{
    self endon("disconnect");
    
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
                else if(self UseButtonPressed())
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
                        wait .25;
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
    self endon("disconnect");

    if(!isDefined(self.menu["curs"][self getCurrent()]))
        self.menu["curs"][self getCurrent()] = 0;

    menu = self getCurrent();
    text = self.menu["items"][self getCurrent()].name;
    curs = self getCursor();
    start = 0;

    if (curs > 2 && curs < (text.size - 3) && text.size > 5)
        start = curs - 2;
    if (curs > (text.size - 4) && text.size > 5)
        start = text.size - 5;

    if(text.size > 0)
    {
        if(isDefined(self.menu["items"][menu].title))
            self iPrintlnBold("^3[ " + self.menu["items"][menu].title + " ]");
        self.lastRefresh = getTime();

        numOpts = text.size;
        if(numOpts >= 5)
            numOpts = 5;
        
        for(a=0;a<numOpts;a++)
        {
            text = self.menu["items"][menu].name;
            str = text[(a + start)];
            if(isDefined(self.menu["items"][menu].bool[(a + start)]))
                str += (isDefined(self.menu_B[menu][(a + start)]) && self.menu_B[menu][(a + start)]) ? " ^2[ON]" : " ^1[OFF]";
            else if(isDefined(self.menu["items"][menu].incslider[(a + start)]))
                str += "^1 < " + self.menu_SS[menu][(a + start)] + " >";
            else if(isDefined(self.menu["items"][menu].slider[(a + start)]))
                str += " < " + self.menu_S[menu][(a + start)][self.menu_SS[menu][(a + start)]] + " >";
            
            if(curs == (a + start))
                self iPrintlnBold("^2   -> " + str + " ^0<-");
            else
                self iPrintlnBold("^." + str);
        }

        if(numOpts < 5)
        {
            printSize = 5 - numOpts;
            for(a=0;a<printSize;a++)
                self iPrintlnBold(".");
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
    self endon("disconnect");
    self endon("menuClosed");

    if(self isInMenu())
    {
        self drawText();
        while(self isInMenu())
        {
            if(self.lastRefresh < GetTime() - 3000)
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
    for(a=0;a<6;a++)
        self iPrintlnBold(".");
}