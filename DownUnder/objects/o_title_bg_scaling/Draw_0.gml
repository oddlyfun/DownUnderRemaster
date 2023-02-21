var _vw = camera_get_view_width(view_camera[0]);
var _vh = camera_get_view_height(view_camera[0]);


// move this to the create event later
spr_width = sprite_get_width(spr_title_screen_BG);
spr_height = sprite_get_height(spr_title_screen_BG);
//


//draw_sprite_stretched(spr_title_screen_BG,0,x,y, _vw, _vh );


// get the integer value for drawing the sprite at different view sizes

var _divisor_w = floor(spr_width / _vw);
var _divisor_h = floor(spr_height / _vh);

var _scale_w = 1 / _divisor_w;
var _scale_h = 1 / _divisor_h;


var _reduce_width_by = spr_width - (_vw * _divisor_w);
var _reduce_height_by = spr_height - (_vh * _divisor_h);


var _new_width = _spr_width - _reduce_width_by;
var _new_height = _spr_height - _reduce_height_by;

var _split_width = _reduce_width_by / 2;

//draw_sprite_part_ext(sprite, subimg, left, top, width, height, x, y, xscale, yscale, colour, alpha);

draw_sprite_part_ext(spr_title_screen_BG, 0, _split_width, 0, _new_width, _new_height, x, y, _scale_w, _scale_h, c_white, 1);
