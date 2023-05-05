// 5 Minute Timer to DEATH
if ( floor(time) >= (60 * 5 ) )
{
	with ( o_player_fish )
	{
		if ( my_health > 0 )
		{
			my_health = 0;
		}
	}
} else
{
	time = time + (delta_time / 1000000 );
	time_string = timer_format(time);
}