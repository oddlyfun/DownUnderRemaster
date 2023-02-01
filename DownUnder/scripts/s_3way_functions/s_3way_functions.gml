function s_instance_position_3wrap(_x, _y, _objects)
{
	if ( _x < 0 )
	{
		return instance_position( _x + room_width, _y, _objects );
	}
	
	if ( _x > room_width )
	{
		return instance_position( _x - room_width, _y, _objects );
	}
	
	return instance_position( _x, _y, _objects );
}

function instance_three_way(_x, _y, _objects)
{
	var _player_loc = 0;
	var _click_chk = noone;
	//var _player = instance_nearest(_x,_y, o_player_fish);
	
	if ( _x < 0 )
	{
		_player_loc = 1;
		_click_chk = instance_position(_x + room_width , _y, _objects);
	} else if ( _x > room_width )
	{
		_player_loc = -1;
		_click_chk = instance_position(_x - room_width , _y, _objects);
	} else
	{
		_player_loc = 0;
		_click_chk = instance_position(_x, _y, _objects);
	}

	if ( _click_chk == id )
	{
		_click_chk = noone;
	}
	
	var _items = [_player_loc, _click_chk];
	return _items;
}
