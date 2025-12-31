GiveSvalinnGuard()
{
   self GiveWeapon(getWeapon("zhield_frost_dw"));
   self aat::acquire(getweapon("zhield_frost_dw"), "zm_aat_frostbite");
   self zm_pap_util::repack_weapon(getweapon("zhield_frost_dw"), 4);
   self.var_5ba94c1e = 1;
   self iPrintLn("Svalinn Guard ^2Given"); 
}


GiveClientWeapon(WeaponName, player)
{
    self zm_weapons::give_build_kit_weapon(getweapon(WeaponName));
    self switchtoweapon(getweapon(WeaponName));
    wait .1;
    player giveMaxAmmo(getweapon(WeaponName));
    wait .1;
    player switchToWeapon(getweapon(WeaponName));
    player iPrintLn("You received "+WeaponName);
}
DropWeapon()
{
    Current_Weapon = self GetCurrentWeapon();
    self DropItem(Current_Weapon);
    self iPrintLn("^2Current Weapon Dropped");
}

TakeWeapons()
{
    weapon = self getCurrentWeapon();
    self TakeAllWeapons();
    wait .5;
    self TakeWeapon(weapon);
}

TakeCurrentWeapon()
{
    weapon = self getCurrentWeapon();
    self TakeWeapon(weapon);
    wait .5;
    self TakeWeapon(weapon);
}

acquireaat(id) {
    weapon = self getCurrentWeapon();
    self thread aat::acquire(weapon, id);
} 

RemoveEff()
{
    weapon = self GetCurrentWeapon();
    self thread aat::remove(weapon);
    wait .5;
    self switchToWeapon(weapon);
    self iPrintLn("Removed Effect");
}

bo4_CamoGiver(Camo) 
{
    Weapon = self GetCurrentWeapon();
    self TakeWeapon(Weapon);
    self GiveWeapon(Weapon, self CalcWeaponOptions(Int(Camo), 1, 1, true, true, true, true));
}

UpgradeWeapon()
{
    weapon = self GetCurrentWeapon();
    self TakeWeapon(weapon);
    wait .1;
    self zm_weapons::give_build_kit_weapon(self zm_weapons::get_upgrade_weapon(weapon, zm_weapons::weapon_supports_aat(weapon)));
    self SwitchToWeapon(self zm_weapons::get_upgrade_weapon(weapon, zm_weapons::weapon_supports_aat(weapon)));
    self iPrintLn("^2Your current weapon has been upgraded!");
}

magicbullets()
{
    self.magicBullets = isDefined(self.magicBullets) ? undefined : true;
    if(isDefined(self.magicBullets))
    {
        self.bulletEffectType = "launcher_standard_t8_upgraded";
        self iPrintLn("Magic Bullets Enabled, Effect: Rocket Launcher");
        while(isDefined(self.magicBullets))
        {
            self waittill(#"weapon_fired");
            MagicBullet(getWeapon(self.bulletEffectType), self getPlayerCameraPos(), BulletTrace(self getPlayerCameraPos(), self getPlayerCameraPos() + anglesToForward(self getPlayerAngles())  * 100000, false, self)["position"], self);
            wait .25;
        }
    }
    else 
    {
        self iPrintLn("Magic Bullets ^1Disabled");
        self.bulletEffectType=undefined;
    }
}

changeBulletType(val)
{
    if(isDefined(self.bulletEffectType))
    {
        switch(val)
        {
            case 0: self.bulletEffectType=  "minigun"; self iPrintLn("Bullet Effect Set To: Minigun"); break;
            case 1: self.bulletEffectType = "special_ballisticknife_t8_dw_upgraded"; self iPrintLn("Bullet Effect Set To: Ballistic Knife"); break;
            case 2: self.bulletEffectType = "launcher_standard_t8_upgraded"; self iPrintLn("Bullet Effect Set To: Rocket Launcher"); break;
            case 3: self.bulletEffectType = "ray_gun"; self iPrintLn("Bullet Effect Set To: Ray Gun"); break;
        }
    }
    else
    {
        self iPrintLn("Custom Bullet Effects are not Enabled");
    }
}