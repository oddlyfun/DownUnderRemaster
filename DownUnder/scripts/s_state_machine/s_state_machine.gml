/*
Attributes -
	Health
	Energy

Goals - 
	Stay Healthy
		Look for a cleaner fish
	Don't Starve (look for food)
		Avoid being eaten

Needs -
	Eating is more important than Health
	Avoiding being eaten is more important than eating

Seeking Player -
	Hunger and no other predators around try to eat the player
	If the player runs away and gets too far give up
*/

function state_machine(_fish_brain)
{
	fish_brain = _fish_brain._BRAIN_;

	var _food_radius = 200 + floor(sprite_width / 2);
	var _life_check = ds_list_create();
	var _coll_circ = collision_circle_list(x,y, _food_radius, o_sea_life,false,true,_life_check,false);

	
//****************************************************************************
//
//					 Use the one collision list to filter
//
//****************************************************************************

	//collision_circle_list(x1, y1, rad, obj, prec, notme, list, ordered);

	var _valid_to_eat = [];
	var _index_eat = 0;
// cleaners id : 56 (fish) , 60 (shrimp)
	var _valid_cleaner = [];
	var _index_clean = 0;
	
	var _valid_enemy = [];
	var _index_enemy = 0;

	for (var i = 0; i < ds_list_size(_life_check); i++)
	{
		var _fish = _life_check[| i];
		
		var _tasty = s_check_food(id, _fish);
		if (_tasty.edible == true)
		{
			_valid_to_eat[@ _index_eat] = _fish;
			_index_eat = _index_eat + 1;
		}

		if ( _fish.fish_id == 56 or _fish.fish_id == 60 )
		{
			_valid_cleaner[@ _index_clean] = _fish;
			_index_clean = _index_clean + 1;
		}
		
		var _is_enemy = s_check_for_enemies(id,_fish);
		if ( _is_enemy == true )
		{
			_valid_enemy[@ _index_enemy] = _fish;
			_index_enemy = _index_enemy + 1;
		}

	}
// check it
	_fish_brain._HUNGER_ = _valid_to_eat;
	_fish_brain._RUNAWAY_ = _valid_enemy;
	_fish_brain._HEALTH_ = _valid_cleaner;



//****************************************************************************
//
//					Food State		
//
//****************************************************************************

	// Val 1 current energy
	var _curent_energy = 1 - (my_energy / 100 ); // Inverse relationship the less energy the higher the score
	// val 2 amount of food around
	var _amount_of_prey = array_length(_valid_to_eat);
	if ( _amount_of_prey > 0 ) then _amount_of_prey = 1;
	
	var _val = ( _curent_energy * _amount_of_prey );
	
	
	
	fish_brain[@ ENERGY] = sqrt(1 - power(_val - 1, 2));

//****************************************************************************
//
//						Health Value
//			Check for a cleaner fish if it's around
//
//****************************************************************************

	var _current_health = 1 - (my_health / 100); // inverse relation
	var _cleaner_nearby = array_length(_valid_cleaner);
	if ( _cleaner_nearby > 0 )
	{
		_cleaner_nearby = 1;
	}
	_val = ( _current_health * _cleaner_nearby);

	fish_brain[@ HEALTH] = sqrt(1 - power(_val - 1, 2));

//****************************************************************************
//
//						Check to run away			
//
//****************************************************************************

	
	//_valid_enemy
	var _threat_amount = 0;
	//var _avg_threat_dist = 0;
	//var _THREAT_ = 0;


	var _amount_of_enemies = array_length(_valid_enemy);
	var _threat_assesment = 0;

	if ( _amount_of_enemies > 0 )
	{
		var _sorting_grid = ds_grid_create(2,_amount_of_enemies);
		// Sort in the worst way
		for ( var i = 0; i < _amount_of_enemies; i++ )
		{
			var _ve = _valid_enemy[@ i];
			_sorting_grid[# 0,i ] = _ve;
			_sorting_grid[# 1,i ] = point_distance(x,y,_ve.x,_ve.y);
		}

		//ds_grid_sort(index, column, ascending);
		ds_grid_sort(_sorting_grid, 1, true );

		for ( var i = 0; i < _amount_of_enemies; i++ )
		{
			_valid_enemy[@ i] = _sorting_grid[# 0,i ];
		}
		// End sorting in the worst way 
		

		var _max_dist = 200;
		_threat_amount = 1;
		var _threat_dist = _sorting_grid[# 1, 0];
		_threat_dist = 1 - (clamp(_threat_dist,0,_max_dist) / _max_dist);
		// quad ease out
		_threat_dist = 1 - (1 - _threat_dist) * (1 - _threat_dist);
		
		ds_grid_destroy(_sorting_grid);

		_threat_assesment = (_threat_amount + _threat_dist) / 2;
	}
	
		fish_brain[@ THREAT] = _threat_assesment

//********************************************************************************************
//
//	 Check for the player -- even if 'offscreen'
//
//********************************************************************************************
	var _hunt_player = 0;
	var _player = instance_nearest(x,y,o_player_fish);
	if ( instance_exists(_player))
	{

		var _eat_check = s_check_food(id,_player);
		if ( _eat_check.edible == true )
		{
			var _center = point_distance(x,y,_player.x,_player.y);
			var _right = point_distance(x + room_width, y, _player.x, _player.y);
			var _left = point_distance(x - room_width, y, _player.x, _player.y);
			var _arr = [_center, _right, _left];
			for ( var i = 0; i < array_length(_arr); i++ )
			{
				var _dist = _arr[@ i];
				if ( _dist <= 200 )
				{
					_hunt_player = 1;
					break;
				}
			}
		}
	}

	if ( _player.ability_active == true ) then _hunt_player = _hunt_player / 2;

	// Turned this off for testing
	fish_brain[@ PLAYER] = 0; //_hunt_player;


//****************************************************************************
//
//				Base line action to swim				
//
//****************************************************************************
	fish_brain[@ SWIM] = 0.65 //Base line activity of just swiming around [?wont interrupt if already moving?]

//****************************************************************************
//
//				Clean Up				
//
//****************************************************************************
	ds_list_destroy(_life_check);
}
