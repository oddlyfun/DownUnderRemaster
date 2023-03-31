max_speed = 4;
is_eating = false;
eating_distance = 100;
eating_target = noone;
eating_x = 0;
eating_y = 0;
eating_zone = 0;
energy_recovery = 12;
my_score = 0;
facing_dir = 1;
is_dead = false;
ability_active = false;

frame = 0;

var _fish = variable_struct_get(global.all_life, string(global.player_fish_id) );

fish_id = global.player_fish_id;
sprite_asset_string = _fish.sprite_name;

sprite_index = asset_get_index(sprite_asset_string);
if ( !sprite_exists(sprite_index) )
{
	sprite_index = spr_not_applicable;
}

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

swim_speed = real(swim_speed) + 2;
health_rate = real(health_rate);
energy_rate = real(energy_rate);
energy_value = real(energy_value);
turn_speed = real(turn_speed);

health_decline = my_health / ( global.GAME_FPS * health_rate);
energy_decline = my_energy / ( global.GAME_FPS * energy_rate);
uni_color = shader_get_uniform(shd_color_caf, "_custom_color");

event_inherited();
