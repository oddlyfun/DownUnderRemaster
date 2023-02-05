// wrap
right_side = x + room_width;
left_side = x - room_width;


// fish logic goes here
// think like a fish that was programmed in 1995
if ( frozen == false )
{
	// State machine goes here!?
	if ( x - swim_speed <= 0 ) then swim_speed = swim_speed * - 1;

	if ( x + swim_speed >= room_width ) then swim_speed = abs(swim_speed);

	x = x - (swim_speed * 0.5);
}