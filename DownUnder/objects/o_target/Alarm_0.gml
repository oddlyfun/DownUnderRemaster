if ( array_length(fish_spawn_list) > 0 )
{
	var _id =  fish_spawn_list[0];

	var _fish = variable_struct_get(global.all_life, string(_id) );
	var _sprite_name = _fish.sprite_name;
	_sprite_name = asset_get_index(_sprite_name);

	if ( _sprite_name == -1 ) then _sprite_name = spr_not_applicable;

	var _inst = instance_create_layer(_rx,_ry,"Instances", o_moron_fish,{
		sprite_index			: _sprite_name
	});
	array_push(spawn_list, _inst);
	array_delete(fish_spawn_list,0,1);
	alarm_set(0,30);	
}
