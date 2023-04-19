speed = swim_speed * abs(global.PAUSED - 1);

if ( global.PAUSED == true )
{
	exit;
}


if ( frozen == false )
{
	// speed change based on energy
	if ( my_energy < 20 )
	{
		speed = speed * 0.60;
	} else if ( my_energy < 50 )
	{
		speed = speed * 0.85;
	}


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
	for ( var i = 0; i < array_length(state_ai._BRAIN_); i++ )
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
//******************************************************************************
//							Eating Some FISHY
//******************************************************************************
		case ENERGY:
			var _meals = state_ai._HUNGER_;
			if ( !instance_exists(meal_target) )
			{
				if ( array_length(_meals) > 0 )
				{
					var _rf = irandom( array_length(_meals) - 1 );
					meal_target = _meals[@ _rf];
				}
			} else if ( instance_exists(meal_target) )
			{
				direction = point_direction(x,y, meal_target.x, meal_target.y);
				speed = swim_speed;

				var _dist = point_distance(x,y, meal_target.x, meal_target.y);

				if ( _dist <= 10 )
				{
					my_energy = my_energy + 40;
					my_energy = clamp(my_energy,0,100);

					var _nibble = false;
					var _cleaner = false;
					for ( var n = 0; n < array_length(my_tags); n++)
					{
						if ( my_tags[@ n] == "nibble") then _nibble = true;
						if ( my_tags[@ n] == "cleaner") then _cleaner = true;
					}

					if ( _cleaner == true )
					{
						meal_target.my_health = meal_target.my_health + 40;
						meal_target.my_health = clamp(meal_target.my_health,0,100);
					}

					if ( meal_target.destroyed_when_eaten == true and _nibble == false )
					{
						var _player = instance_nearest(x,y,o_player_fish);
						if ( meal_target != _player )
						{
							instance_destroy(meal_target);
							state_machine(state_ai);
						} else
						{
							meal_target.is_dead = true;
						}
					}

				} else
				{
					meal_target.frozen = true;
				}
			}
		break;
//******************************************************************************
//							Just Keep Swiming
//******************************************************************************
		case SWIM:
			if ( is_swiming == false )
			{
				state_ai._SWIM_.x = irandom_range(0,room_width);
				state_ai._SWIM_.y = irandom_range(0,room_height);
				//direction = point_direction(x,y, state_ai._SWIM_.x, state_ai._SWIM_.y);
				speed = swim_speed;
				is_swiming = true;
			} else
			{
				var _dist = point_distance(state_ai._SWIM_.x, state_ai._SWIM_.y, x, y);
				direction = point_direction(x,y, state_ai._SWIM_.x, state_ai._SWIM_.y);
				if ( _dist <= 10 )
				{
					is_swiming = false;
					speed = 0;
				}
			}
		break;
//******************************************************************************
//							Run Away
//******************************************************************************
		case THREAT:
			var _run = state_ai._RUNAWAY_;
			var _len_run = array_length(_run);
			var _avg_dir = 0;
			var _badnews = noone;

			if ( _len_run > 0 )
			{
				for ( var i = 0; i < _len_run; i++ )
				{
					_badnews = _run[@ i];
					if ( instance_exists(_badnews) )
					{
						_avg_dir = _avg_dir + point_direction(x,y, _badnews.x, _badnews.y);
					}
				}

				direction = (_avg_dir / _len_run) - 180;
				speed = swim_speed;
			}
		break;
//******************************************************************************
//							Find a Cleaner fish
//******************************************************************************
		case HEALTH:
			var _clean = state_ai._HEALTH_;
			if ( array_length(_clean) > 0 )
			{
				var _cleaner_fish = _clean[@ 0];

				if ( instance_exists(_cleaner_fish) )
				{
					direction = point_direction(x,y, _cleaner_fish.x, _cleaner_fish.y);
					speed = swim_speed;

					if ( point_distance(x,y, _cleaner_fish.x, _cleaner_fish.y) < 10 )
					{
						my_health = my_health + 5;
						my_health = clamp(my_health,0,100);
					}
				}
			}
		break;
//******************************************************************************
//							Chase the player
//******************************************************************************
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
} else if ( frozen == true )
{
	speed = 0;
}
