// converts all the list values I want back into lists if it became a string from 
// loading the json file
var val = typeof(food_bad);
if val == "string" then food_bad = [food_bad];

val = typeof(food_good);
if val == "string" then food_good = [food_good];

val = typeof(food_ok);
if val == "string" then food_ok = [food_ok];

val = typeof(my_abilities);
if val == "string" then my_abilities = [my_abilities];

val = typeof(my_tags);
if val == "string" then my_tags = [my_tags];

val = typeof(enemies);
if val == "string" then enemies = [enemies];

// converting string to what they should be... I know I am trying to avoid some sort
// of import export error in my json. Oh its because other parts of the json could be 
// single digits but I really want those values to be strings for food reasons
swim_speed = real(swim_speed);
health_rate = real(health_rate);
energy_rate = real(energy_rate);
energy_value = real(energy_value);
turn_speed = real(turn_speed);


// camera wraping vars
//the_camera = camera_get_active();
the_camera = camera_get_default();
right_side = x + room_width;
left_side = x - room_width;

moving_towards_point_x = 0;
moving_towards_point_y = 0;

is_moving = false;
target_point_x = 0;
target_point_y = 0;


// State Machine Brain
state_ai = {
	_EAT_ 		: 0,
	_SWIM_ 		: 0,
	_THREAT_ 	: 0,
	_HEALTH_ 	: 0
};

alarm_set(0,1);