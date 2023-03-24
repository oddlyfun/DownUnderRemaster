// converts all the list values I want back into lists if it became a string from 
// loading the json file
var val = typeof(food_bad);
if val == "string" then food_bad = [food_bad];

val = typeof(food_good);
if val == "string" then food_good = [food_good];

val = typeof(food_ok);
if val == "string" then food_ok = [food_ok];

//val = typeof(my_abilities);
//if val == "string" then my_abilities = [my_abilities];

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

facing_dir = 1;

// ******
//
//  Health and Energy reduction rates could be based on time to live 
//  (Need to update data file I changed all energy_rate health_rate to 60)
//
// ******

health_decline = (global.GAME_FPS) / (global.GAME_FPS * health_rate);
energy_decline = (global.GAME_FPS) / (global.GAME_FPS * energy_rate);


// camera wraping vars
//the_camera = camera_get_active();
the_camera = camera_get_default();
right_side = x + room_width;
left_side = x - room_width;

swim_target = new vector2(0,0);
meal_target = noone;
is_swiming = false;

// State Machine Brain
//#macro ENERGY 0
//#macro SWIM 1
//#macro THREAT 2
//#macro HEALTH 3
//#macro PLAYER 4
brain_array = [];
brain_array[@ ENERGY] = 0;
brain_array[@ SWIM] = 0.85;
brain_array[@ THREAT] = 0;
brain_array[@ HEALTH] = 0;
brain_array[@ PLAYER] = 0;


state_ai = {
	_BRAIN_ : brain_array, 		// Array
	_HUNGER_ : [], 			// Array
	_RUNAWAY_ : [], 			// Array
	_HEALTH_ : [], 			// Array
	_HUNT_ : o_player_fish, 	// Object
	_SWIM_ : swim_target, 		// Vector2
};

alarm_set(0,1);
