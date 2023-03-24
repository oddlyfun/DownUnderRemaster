if ( global.PAUSED == true )
{
	var _salt = irandom_range(-5, 10);
	alarm_set(0,game_get_speed(gamespeed_fps) + _salt);
	exit;
} 
// If the camera is looking at the spawner then don't spawn a fish 

var _cam_x = camera_get_view_x(view_camera[0]);
var _cam_y = camera_get_view_y(view_camera[0]);
var _cam_w = camera_get_view_width(view_camera[0]);
var _cam_h = camera_get_view_height(view_camera[0]);





// adds a spawn to its list if it has space
if (ds_list_size(spawn_list) < max_spawns)
{
	// get a random index to spawn
	var _r = irandom(ds_list_size(spawn_id_list)-1);
	// _r will refrence the type of fish based on the master list
	_r = spawn_id_list[| _r];
		
	// gets the fish from the all life struct and then sets all the variables for the new fish
	var _fish = variable_struct_get(global.all_life, string(_r) );
	var _sprite_name = _fish.sprite_name;
	_sprite_name = asset_get_index(_sprite_name);
		
	if ( _sprite_name != -1 )
	{
		var _dir = 0;
		var _rx = 0;

		if ( irandom_range(0,1) == 0 )
		{
			_rx = irandom_range(-40,-20);
			_dir = 0;
		} else
		{
			_rx = _cam_w + 100;
			_dir = 180;
		}

		var _ry = irandom_range(0, _cam_h);

		var _spd =  irandom_range(1,3);

		
		var _inst = instance_create_layer(_rx,_ry,"Instances",o_brainless_fish,{
			fish_id					: _r,
			sprite_index			: _sprite_name,
			speed 					: _spd,		
			direction 				: _dir	
		});
		
		
		ds_list_add(spawn_list,_inst);
	}
}


var _salt = irandom_range(-5, 10);
alarm_set(0,game_get_speed(gamespeed_fps) + _salt);
