//swim_speed = 6;
speed = swim_speed * abs(global.PAUSED - 1);

if ( global.PAUSED == true )
{
	exit;
}


var _cursor = instance_nearest(0,0,o_mouse);
if ( !instance_exists(_cursor) ) then exit;

if ( is_eating == false )
{
	direction = point_direction(x,y,mouse_x,mouse_y);
	var _dist = floor(distance_to_point(mouse_x,mouse_y));
	var _energy_redux = 0;

	if ( _dist <= 10 ){
		speed = 0;
		_energy_redux = energy_decline * 0.95;
		
	} else
	{
		speed = swim_speed;
		my_score = my_score + 1;
		_energy_redux = energy_decline * 1.15;
	}

	//show_debug_message( string( frame ) );
	//frame = frame + (delta_time/1000000);
	
	my_energy = my_energy - _energy_redux;
	my_health = my_health - health_decline;

//******************************************************************
//			Clicking on some sea life (when not eating)
//******************************************************************

	if ( mouse_check_button_pressed(mb_left) )
	{
		var _cursor_target = _cursor.hover_inst;
		
		if ( instance_exists(_cursor_target) ) 
		{
			eating_x = _cursor.x;
			eating_y = _cursor.y;
			_dist = point_distance(x,y, eating_x, eating_y);
		
			if ( _dist < eating_distance )
			{
				is_eating = true;
				eating_target = _cursor_target;
				eating_target.frozen = true;
			}
		}
	}

//******************************************************************
//				Using your ability
//******************************************************************

	if ( string_length(my_abilities) > 1 )
	{
		// >1 I have an ability to even use
		ability_active = false;
		if ( keyboard_check(vk_space) )
		{
			ability_active = true;
			// only a few abilities something extra happens
			// ink & puffer fish
			my_energy = my_energy - (_energy_redux * 0.10)
		}
	}

}


if ( is_eating == true )
{

	direction = point_direction(x,y,eating_x, eating_y);
	var _dist = floor(distance_to_point(eating_x, eating_y));

	if ( _dist <= max_speed )
	{
		//speed = 0;
		eating_target.frozen = false;
		var _was_eaten = s_check_food(id, eating_target);
		// done eating
		if ( _was_eaten.edible == true )
		{
			my_energy = my_energy + energy_recovery;
			my_energy = clamp(my_energy,0, 100);
			my_score = my_score + 500;

			var _nibble = false;
			for ( var n = 0; n < array_length(my_tags); n++)
			{
				if ( my_tags[@ n] == "nibble") then _nibble = true;
			}
			
			if ( eating_target.destroyed_when_eaten == true and _nibble == false )
			{
				instance_destroy(eating_target);
			}
		}
		add_message(_was_eaten.msg, _was_eaten.fish_name);
		eating_target = noone;
		is_eating = false;
	} else
	{
		speed = swim_speed;
	}
}

// floor causing movement issues
//x = round(x);
//y = round(y);


// check for dying 




if ( global.LEVEL_OVER == false ) 
{
	if ( my_health <= 0 or my_energy <= 0 or is_dead == true )
	{
		global.PAUSED = true;
		global.LEVEL_OVER = true;
		global.player_score = global.player_score + my_score;
		instance_create_layer(0,0,"Exit_Menu",o_game_over);
		remove_save_file(); // delete the save file 
		//instance_destroy(id);
	}

	if ( global.GAME_MODE == GAUNTLET or global.GAME_MODE == CHALLENGE)
	{
		if ( my_score >= 5000 )
		{
			global.player_score = my_score + global.player_score; 
			global.PAUSED = true;
			global.LEVEL_OVER = true;
			global.WIN_LEVEL = true;
			
			array_delete(global.LOAD_GAME_LIST,0,1);
			
			if ( array_length(global.LOAD_GAME_LIST) > 0 )
			{
				save_my_game();
				instance_create_layer(0,0,"Exit_Menu",o_win_level);
				//instance_destroy(id);
			} else
			{
				// Actually BEAT challenge or gauntlet mode
				global.player_score = global.player_score + 1000;
				instance_create_layer(0,0,"Exit_Menu",o_game_over);
			}
		}
	}
}
