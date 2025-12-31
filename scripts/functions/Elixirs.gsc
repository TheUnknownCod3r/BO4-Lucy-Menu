
GiveInstantElixir(name) //Works for Instant Elixirs
{
    self thread bgb::function_b7ba7d51(name);//Actually gives instant use elixir like Perkaholic etc, Doesnt work for timed Elixirs.
    self thread bgb::give(name);//gives popup for the Elixir on screen, should work for all
}
GiveTimedElixir(name)//Works for Timed Elixirs
{
    self thread bgb::function_62f40b0d(name);//Gives Timed Elixir, Doesnt work for Single Use Elixirs.
    self thread bgb::give(name);//Just for elixir popup
}

GiveElixir(which,name)
{
    which = int(which);
    switch(which)
    {
        case 1: self thread bgb::function_b7ba7d51(name);break;//Instant Use
        case 2: self thread bgb::function_62f40b0d(name);break;//Timed
    }
    self thread bgb::give(name);
}