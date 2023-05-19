if ( array_length(spawn_list) > 1 )
{
	var _prey = spawn_list[0];
	var _hunt = spawn_list[1];

	var _half_w = floor(_hunt.sprite_width / 2);
	var _mouth_x = _hunt.x + lengthdir_x(_half_w, _hunt.direction);
	var _mouth_y = _hunt.y + lengthdir_y(_half_w, _hunt.direction)

	//var _dist = point_distance(_mouth_x, _mouth_y, _prey.x, _prey.y);
	
	var _point = collision_point( _mouth_x, _mouth_y, _prey, false, true);
	

	//if ( _dist <= 3 )
	if ( _point == _prey )
	{
		instance_create_layer(_prey.x, _prey.y, "Exit_Menu", o_aargh);
		instance_destroy(_prey);
		_hunt.my_target = noone;
		if ( _hunt.x < 300 ) 
		{
			_hunt.direction = 0;
		} else
		{
			_hunt.direction = 180;
		}
		_hunt.speed = 1;
		array_delete(spawn_list,0,1);
	}
}
