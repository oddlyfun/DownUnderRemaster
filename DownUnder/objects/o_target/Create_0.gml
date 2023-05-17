fish_spawn_list = [58, 47, 39, 18, 1, 52, 13, 43, 26, 44, 17, 19, 32, 12, 21, 51, 22, 5, 23];
spawn_list = [];
alarm_set(0,1);

var _base_fish = instance_create_layer(x,y, "Instances", o_moron_fish);
_base_fish.state = 1;
_base_fish.direction = 0;
_base_fish.sprite_index = spr_worm;

spawn_list[0] = _base_fish;
