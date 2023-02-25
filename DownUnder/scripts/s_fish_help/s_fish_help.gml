function s_check_food(_fish, _target)
{
	// Need to check good good arrays 
	// Bad food arrays
	var _good = _fish.food_good;
	var _ok = _fish.food_ok;
	var _bad = _fish.food_bad;

	var _tar_id = _target.fish_id;
	var _tar_size = _target.fish_size;

	var _is_good = false;
	var _is_bad = false;
	var _is_ok = false;

	// GOOD food check
	for ( var i = 0; i < array_length(_good); i++ )
	{
		var _val = _good[@ i];
		if ( _val == _tar_id or _val == _tar_size )
		{
			_is_good = true;
			break;
		}
	}
	
	// OK food check
	for ( var i = 0; i < array_length(_ok); i++ )
	{
		var _val = _ok[@ i];
		if ( _val == _tar_id or _val == _tar_size )
		{
			_is_ok = true;
			break;
		}
	}

	// BAD good check
	for ( var i = 0; i < array_length(_bad); i++)
	{
		var _val = _bad[@ i];
		if ( _val == _tar_id or _val == _tar_size )
		{
			_is_bad = true;
			break;
		}
	}


	/// Resolve if I can or can't eat the damn fish

	var _can_i_eat = false;
	var _eat_message = "Eating Unknown";
	//var _was_i_poisoned = false;

	if ( _is_bad == true )
	{
		_can_i_eat = false;
		_eat_message = "Couldn't eat"
	} else if ( _is_good == true)
	{
		_can_i_eat = true;
		_eat_message = "Yummy! Food!"
	} 
	
	if ( _is_bad == false and _is_good == false and _is_ok == false )
	{
		_can_i_eat = false;
		_eat_message = "Not on your menu";
	}


// Create a struct that will give me all the information I need to create a message pop up
	_eating_report =
	{
	    edible : _can_i_eat,
	    msg : _eat_message,
		fish_name : _target.fish_name
	};

	return _eating_report;
}




function s_fish_help(_string)
{
	
	switch _string
	{
		case "ES":
			return 0.7;
		break;
		
		case "S":
			return 0.8;
		break;
		
		case "MS":
			return 0.9;
		break;
		
		case "M":
			return 1;
		break;
		
		case "ML":
			return 1.1;
		break;
		
		case "L":
			return 1.2;
		break;
		
		case "EL":
			return 1.5;
		break;
		
		default:
			return 1;
	}
}


function challenge_list()
{
/*
	//ES
		34,47,11,20
	//S
		7,33,37,49,18,25,27,1,2,10,30,38,39,40,45,52,54,6,41
	//MS
		8,13,4,43,14,26,29,48
	//M
		44,9,28,17,31,16,19,32,36,35
	//ML
		46,12,21,50,42,3,51,15
	//L
		22,5,24,53
	//EL
		23
*/
	var picked_array = [];
	var _r_list = noone;
	var fish_one_options = [34,47,11,20,7,33,37,49,18,25,27,1,2,10,30,38,39,40,45,52,54,6,41];
	var fish_two_options = [8,13,4,43,14,26,29,48,44,9,28,17,31,16,19,32,36,35];
	var fish_three_options = [44,9,28,17,31,16,19,32,36,35,46,12,21,50,42,3,51,15];
	var fish_four_options = [46,12,21,50,42,3,51,15,22,5,24,53]; // going to exclude the great white shark (23)
	var _select_array = [fish_one_options, fish_two_options, fish_three_options, fish_four_options]

	for ( var i = 0; i < array_length(_select_array); i++ )
	{
		var choice_array = _select_array[@ i];	

		while ( true )
		{
			_r_list = irandom(array_length(choice_array) - 1);
			_r_list = choice_array[@ _r_list];

			var _no_repeats = false;
			for ( var i = 0; i < array_length(picked_array); i++ )
			{
				var _c = picked_array[@ i];
				if ( _c == _r_list ) then _no_repeats = true;
			}

			if ( _no_repeats == false )
			{
				picked_array[@ i] = _r_list;
				break;
			}
		}

	}

	var _fishy_list = [];
	for ( var i = 0; i < array_length(picked_array); i++ )
	{
		var _fish_index = picked_array[@ i];
		var _fishy_struct = variable_struct_get(global.all_life, string(_fish_index) );
		_fishy_struct.fish_id = _fish_index;
		_fishy_list[@ i] = _fishy_struct;
	}

	return _fishy_list;
}

function fishy_practice()
{
	var _flist = [];

	for ( var i = 0; i < ds_list_size(global.playable_fish); i++)
	{
		_flist[@ i] = global.playable_fish[| i];
	}

	return _flist;
}

function fishy_gauntlet()
{
	var fish_smallest_to_largest = [34,47,11,20,7,33,37,49,18,25,27,1,2,10,30,38,39,40,45,52,54,6,41,8,13,4,43,14,26,29,48,44,9,28,17,31,16,19,32,36,35,46,12,21,50,42,3,51,15,22,5,24,53,23];

	var _fishy_list = [];

	for ( var i = 0; i < array_length(fish_smallest_to_largest); i++ )
	{
		var _fish_index = fish_smallest_to_largest[@ i];
		var _fishy_struct = variable_struct_get(global.all_life, string(_fish_index) );
		_fishy_struct.fish_id = _fish_index;
		_fishy_list[@ i] = _fishy_struct;
	}

	return _fishy_list;
}
