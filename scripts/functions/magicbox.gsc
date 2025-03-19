TpToChest()
{
    Chest = level.chests[level.chest_index];
    origin = Chest.zbarrier.origin;
    FORWARD = AnglesToForward(Chest.zbarrier.angles);
    right = AnglesToRight(Chest.zbarrier.angles);
    BAngles = VectorToAngles(right);
    BOrigin = origin - 48 * right;
    switch(randomInt(3))
    {
        case 0:
            BOrigin = BOrigin + 16 * right;
            break;
        case 1:
            BOrigin = BOrigin + 16 * FORWARD;
            break;
        case 2:
            BOrigin = BOrigin - 16 * right;
            break;
        case 3:
            BOrigin = BOrigin - 16 * FORWARD;
            break;
    }
    self SetOrigin(BOrigin);
    self SetPlayerAngles(BAngles);
}

ShowAllBoxes()
{
    foreach(chest in level.chests)
	{
		chest zm_magicbox::show_chest();
	}
}

BoxPrice(value)
{
    foreach(chest in level.chests) chest.zombie_cost = value;

}

BO4FreezeBox()
{
    level.chests[level.chest_index].no_fly_away = (!isDefined(level.chests[level.chest_index].no_fly_away) ? true : undefined);
}
