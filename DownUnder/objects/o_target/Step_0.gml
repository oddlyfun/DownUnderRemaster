if ( array_length(spawn_list) > 1 )
{
	var _prey = spawn_list[0];
	var _hunt = spawn_list[1];

	var _dist = point_distance(_prey.x, _prey.y, _hunt.x. _hunt.y);

	if ( _dist <= 3 )
	{
		instance_create_layer(_prey.x, _prey.y, "Instances", o_aargh);
		instance_destroy(_prey);
		_hunt.state = 1;
		array_delete(spawn_list,0,1);
	}
}
