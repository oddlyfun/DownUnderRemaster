// set in the object on the map the types of fish that CAN spawn in a given spawn zone
spawn_list = ds_list_create();
// the list of spawned objects created
spawn_id_list = ds_list_create();

max_spawns = 10;

alarm_set(0,1);