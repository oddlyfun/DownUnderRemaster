if ( global.PAUSED == true ) then exit;


if ( frozen == false )
{
	/*
	// We will just do a random point direction and move towards that point with no further logic

	if ( is_moving == false )
	{
		is_moving = true;
		target_point_x = irandom_range(0, room_width);
		target_point_y = irandom_range(0, room_height);
		direction = point_direction(x,y, target_point_x, target_point_y);
		speed = 1; // replace with fish speed one day
	}

	var _dist_from_point = point_distance(x,y, target_point_x, target_point_y);

	if ( _dist_from_point <= 10 )
	{
		is_moving = false;
	}

	*/

//**********************************************************************
//
//				State Machine Results Actions
/*
					brain_array[@ ENERGY] = 0;
					brain_array[@ SWIM]   = 0.85;
					brain_array[@ THREAT] = 0;
					brain_array[@ HEALTH] = 0;
					brain_array[@ PLAYER] = 0;
				state_ai = {
					_BRAIN_ 	: brain_array, 		// Array
					_HUNGER_ 	: [],	 			// Array
					_RUNAWAY_ 	: [],	 			// Array
					_HEALTH_ 	: [],	 			// Array
					_HUNT_ 		: o_player_fish, 	// Object
					_SWIM_ 		: swim_target, 		// Vector2
				};
*/
//
//**********************************************************************

	var _largest_index = -1;
	var _largest_value = 0;
	for ( var i = 0; i < array_length(state_ai._BRAIN_) )
	{
		var _val = state_ai._BRAIN_[@ i];
		if ( _val > _largest_value )
		{
			_largest_value = _val;
			_largest_index = i;
		}	
	}

	switch _largest_index
	{
		case ENERGY:
		break;

		case SWIM:
			if ( is_swiming == false )
			{
				state_ai._SWIM_.x = irandom_range(0,room_width);
				state_ai._SWIM_.y = irandom_range(0,room_height);
				direction = point_direction(x,y, _rx, _ry);
				speed = 1;
				is_swiming = true;
			} else
			{
				var _dist = point_distance(state_ai._SWIM_.x, state_ai._SWIM_.y, x, y);
				if ( _dist <= 10 )
				{
					is_swiming = false;
					speed = 0;
				}
			}
		break;
		
		case THREAT:
		break;

		case HEALTH:
		break;

		case PLAYER:
		break;
		
	}



//**********************************************************************
//
//				End State Machine
//
//**********************************************************************


	my_energy = my_energy - energy_decline;
	my_health = my_health - health_decline;
	
	my_energy = clamp(my_energy,0,100);
	my_health = clamp(my_health,0,100);
}
