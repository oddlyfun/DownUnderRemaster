var _half_sprite = inst_attch.sprite_width / 2;
var _mouth_x = x - lengthdir_x(_half_sprite,inst_attch.direction);
var _mouth_y = y - lengthdir_y(_half_sprite,inst_attch.direction);

draw_sprite_ext(sprite_index, image_index, _mouth_x, _mouth_y, 1,1, inst_attch.direction - 180, c_white, 1);