
if ( finished_loading == false )
{
	var _main_array = pre_load_array[@ main_index];
	var _item = _main_array[@ sub_index];

	sprite_prefetch(_item);
	
	
	
	sub_index = sub_index + 1;

	if ( sub_index >= array_length(_main_array) )
	{
		main_index = main_index + 1;
		sub_index = 0;
	}
	
} else if ( finished_loading == true )
{
	if ( global.FIRST_LOAD == false )
	{
		room_goto(ro_start_screen);
	} else
	{
		room_goto(ro_how_to_play);
		global.FIRST_LOAD = false;
		save_game_settings();
	}
}


if ( main_index >= array_length(pre_load_array) )
{
	finished_loading = true;
}