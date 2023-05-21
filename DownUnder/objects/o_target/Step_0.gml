if ( array_length(spawn_list) > 1 )
{
	var _prey = spawn_list[0];
	var _hunt = spawn_list[1];

	var _half_w = floor(_hunt.sprite_width / 2);
	var _mouth_x = _hunt.x + lengthdir_x(_half_w, _hunt.direction);
	var _mouth_y = _hunt.y + lengthdir_y(_half_w, _hunt.direction)
	
	var _point = collision_point( _mouth_x, _mouth_y, _prey, false, true);
	
	if ( _point == _prey )
	{
		instance_create_layer(_prey.x, _prey.y, "Exit_Menu", o_aargh);
		instance_destroy(_prey);
		audio_play_sound(sfx_being_eaten,1,false);
		_hunt.my_target = noone;

		_hunt.speed = 6;
		array_delete(spawn_list,0,1);
	}
}
