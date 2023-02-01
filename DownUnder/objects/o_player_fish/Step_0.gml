if ( is_eating == false )
{
	direction = point_direction(x,y,mouse_x,mouse_y);
	var _dist = floor(distance_to_point(mouse_x,mouse_y));

	var _energy_redux = energy_rate;

	if ( _dist <= max_speed ){
		speed = 0;
		_energy_redux = energy_rate * 0.01;
		
	} else
	{
		speed = max_speed;
		_energy_redux = energy_rate * 0.05;
	}

	my_energy = my_energy - _energy_redux;

//******************************************************************
//			Clicking on some sea life (when not eating)
//******************************************************************

	if ( mouse_check_button_pressed(mb_left) )
	{
		var _three_way = instance_three_way(mouse_x, mouse_y, o_sea_life);
		
		var _id = _three_way[@ 1];
		var _lor = _three_way[@ 0];
		
		if ( _id != noone )
		{
			// player x value that takes into account if its in the far left or far right screen zone
			var _norm_x = x + ( _lor * room_width );
			var _dist = point_distance(_norm_x, y, _id.x, id.y);
			if ( _dist < eating_distance )
			{
				is_eating = true;
				eating_target = _id;
				eating_zone = _lor;
			}

		}
	}
}


if ( is_eating == true )
{
	_target_x = eating_target.x + ( (-1 * eating_zone) * room_width );

	direction = point_direction(x,y,_target_x, eating_target.y);
	var _dist = floor(distance_to_point(_target_x, eating_target.y));

	if ( _dist <= max_speed ){
		speed = 0;
		var _was_eaten = s_check_food(id, eating_target);
		// done eating
		if ( _was_eaten.edible == true ) then instance_destroy(eating_target);

		add_message(_was_eaten.msg, "Devour");
		eating_target = noone;
		is_eating == false;
	} else
	{
		speed = max_speed;
	}
}
