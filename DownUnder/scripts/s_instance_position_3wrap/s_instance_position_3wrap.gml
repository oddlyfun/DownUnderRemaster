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