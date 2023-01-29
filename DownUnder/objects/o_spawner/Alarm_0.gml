// If the camera is looking at the spawner then don't spawn a fish 

var _cam_x = camera_get_view_x(view_camera[0]);
var _cam_y = camera_get_view_y(view_camera[0]);
var _cam_w = camera_get_view_width(view_camera[0]);
var _cam_h = camera_get_view_height(view_camera[0]);

// Currently thinking 3 collision checks might be needed just in case of screen wrap and if any are true then don't spawn a fish


// Normal
var _center_cam = collision_rectangle(_cam_x, _cam_y, _cam_x + _cam_w, _cam_h + _cam_y, id, false, false);
//if the camera is on the left side
var _left_x = _cam_x - room_width;
var _left_cam = collision_rectangle(_left_x, _cam_y, _left_x + _cam_w, _cam_h + _cam_y, id, false, false);

var _right_x = _cam_x + room_width;
var _right_cam = collision_rectangle(_right_x, _cam_y, _right_x + _cam_w, _cam_h + _cam_y, id, false, false);


if ( _center_cam == noone and _left_cam == noone and _right_cam == noone )
{
	// adds a spawn to its list if it has space
	if (ds_list_size(spawn_list) < max_spawns)
	{
		// get a random index to spawn
		var _r = irandom(ds_list_size(spawn_id_list)-1);
		// _r will refrence the type of fish based on the master list
		_r = spawn_id_list[| _r];
		
		// gets the fish from the all life struct and then sets all the variables for the new fish
		var _fish = variable_struct_get(global.all_life, string(_r) );
		
		var _inst = instance_create_layer(x,y,"Instances",o_sea_life,{
			fish_id : _r,
			sprite_index : spr_npc_fish,
			fish_name				: _fish.full_name,
			fish_size				: _fish.size,
			health_rate				: _fish.health_rate,
			energy_rate				: _fish.energy_rate,
			energy_value			: _fish.energy_value,
			swim_speed				: _fish.swim_speed,
			turn_speed				: _fish.turn_speed,
			food_good				: _fish.food_good,
			food_ok					: _fish.food_ok,
			food_bad				: _fish.food_bad,
			my_tags					: _fish.tags,
			my_abilities			: _fish.ability,
			playable				: _fish.playable,
			when_active				: _fish.active,
			my_notes				: _fish.notes,
			my_scientific_name		: _fish.scientific_name
			
		});
		
		//show_debug_message("Fish Spawn");
		
		ds_list_add(spawn_list,_inst);
	}
}

var _salt = irandom_range(-5, 10);
alarm_set(0,game_get_speed(gamespeed_fps) + _salt);
