// set in the object on the map the types of fish that CAN spawn in a given spawn zone
spawn_list = ds_list_create();
// the list of spawned objects created
//spawn_id_list = ds_list_create();

// list of all playable fish plus some of the really small not playable fish. This is the bulk of what can spawn
spawn_id_list = [34,47,11,20,7,33,37,49,18,25,27,1,2,10,30,38,39,40,45,52,54,6,41,8,13,4,43,14,26,29,48,44,9,28,17,31,16,19,32,36,35,46,12,21,50,42,3,51,15,22,5,24,53,23,
    55,
    57,
    58,
    59,
    80
];

max_spawns = 1;

alarm_set(0,5);
