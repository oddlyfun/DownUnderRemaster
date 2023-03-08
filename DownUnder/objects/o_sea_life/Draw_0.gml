

var _correction = 0;
// right
if ( (direction <= 90 and direction >= 0) or (direction >= 270 and direction <= 360 ) )
{
	facing_dir = 1;
} else
{
	facing_dir = -1;
	_correction = 180;
}


draw_sprite_ext(sprite_index,0,x,y,facing_dir,1, direction-_correction,c_white,1);

// have to draw self in 'another place' because of screen wrap
// I need to know where I exist in those other places 

draw_sprite_ext(sprite_index,0,x+room_width,y,facing_dir,1, direction-_correction,c_white,1);
draw_sprite_ext(sprite_index,0,x-room_width,y,facing_dir,1, direction-_correction,c_white,1);

image_angle = direction;


var _energy = state_ai._BRAIN_[@ ENERGY];
var _health = state_ai._BRAIN_[@ HEALTH];
var _threat = state_ai._BRAIN_[@ THREAT];
var _player = state_ai._BRAIN_[@ PLAYER];
var _swim = state_ai._BRAIN_[@ SWIM];
var _xx = state_ai._SWIM_.x;
var _yy = state_ai._SWIM_.y;

var _string = string(_xx) + "," + string(_yy);

var _c = c_black;
var _w = c_white;
draw_rectangle_color(x-2,y-2, x + string_width("N: 0.000"), y + 60, _w, _w, _w, _w, false );
write_text(x,y,_c,		"E: " + string( _energy) );
write_text(x,y+10,_c,	"H: " + string( _health) );
write_text(x,y+20,_c,	"P: " + string( _player) );
write_text(x,y+30,_c,	"T: " + string( _threat) );
write_text(x,y+40,_c,	"S: " + string( _swim) );
write_text(x,y+50,_c,	"S: " + _string );