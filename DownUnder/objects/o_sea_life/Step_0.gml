if ( global.PAUSED == true ) then exit;

// wrap
right_side = x + room_width;
left_side = x - room_width;


if ( frozen == false )
{
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

	my_energy = my_energy - energy_decline;
	my_health = my_health - health_decline;
	
	my_energy = clamp(my_energy,0,100);
	my_health = clamp(my_health,0,100);
}
