// removes bad refrences to spawns
for ( var i = ds_list_size(spawn_list)-1; i >= 0; i-- )
{
	var _spawn = spawn_list[| i];
	if ( instance_exists(_spawn) == false ){
		ds_list_delete(spawn_list,i);
	}
}


