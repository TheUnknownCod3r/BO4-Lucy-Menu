
BO4newOrigin(Coords, Location)
{
    if(!isDefined(Location))
        Location = "Undefined";
    self SetOrigin(Coords);
    self S("Teleported To "+Location);
}
