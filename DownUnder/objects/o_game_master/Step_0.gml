steam_update();


global.STEAM_API = false;
if ( steam_initialised() )
{
    if ( steam_stats_ready() )
    {
        global.STEAM_API = true;
    }
}
