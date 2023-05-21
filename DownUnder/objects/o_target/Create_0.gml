fish_spawn_list = [58, 47, 18, 52, 13, 26, 17, 32, 12, 21, 51, 22, 23];
spawn_list = [];
alarm_set(0,1);

var _base_fish = instance_create_layer(x,y, "Instances", o_moron_fish);
_base_fish.direction = 0;
_base_fish.sprite_index = spr_worm;

spawn_list[0] = _base_fish;


start_trailer = false;