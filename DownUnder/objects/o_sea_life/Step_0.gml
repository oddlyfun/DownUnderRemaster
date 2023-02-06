// wrap
right_side = x + room_width;
left_side = x - room_width;


// fish logic goes here
// think like a fish that was programmed in 1995
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
		is_moving == false;
	}

}
