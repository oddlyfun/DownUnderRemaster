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
