
// removes bad refrences to spawns
for ( var i = ds_list_size(spawn_list)-1; i >= 0; i-- )
{
	var _spawn = spawn_list[| i];
	if ( instance_exists(_spawn) == false ){
		ds_list_delete(spawn_list,i);
	}
}


// adds a spawn to its list if it has space
if (ds_list_size(spawn_list) < max_spawns)
{
	// get a random index to spawn
	var _r = irandom(ds_list_size(spawn_id_list)-1);
	// _r will refrence the type of fish based on the master list
	_r = spawn_id_list[| _r];
	
	var _inst = instance_create_layer(x,y,"Instances",o_sea_life,{
		fish_id : _r,
		sprite_index : spr_npc_fish
	});
	
	ds_list_add(spawn_list,_inst);
}