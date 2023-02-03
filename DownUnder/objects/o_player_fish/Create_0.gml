max_speed = 4;
is_eating = false;
eating_distance = 100;
eating_target = noone;
eating_zone = 0;
energy_recovery = 12;

var _fish = variable_struct_get(global.all_life, string(global.player_fish_id) );

fish_id = global.player_fish_id;
sprite_index = spr_guppy;

HEALTH_RATE_TICK = room_speed * 0.75;

alarm_set(0,HEALTH_RATE_TICK);

fish_name				= _fish.full_name;
fish_size				= _fish.size;
health_rate				= _fish.health_rate;
energy_rate				= _fish.energy_rate;
energy_value			= _fish.energy_value;
swim_speed				= _fish.swim_speed;
turn_speed				= _fish.turn_speed;
food_good				= _fish.food_good;
food_ok					= _fish.food_ok;
food_bad				= _fish.food_bad;
my_tags					= _fish.tags;
my_abilities			= _fish.ability;
playable				= _fish.playable;
when_active				= _fish.active;
my_notes				= _fish.notes;
my_scientific_name		= _fish.scientific_name;

event_inherited();
