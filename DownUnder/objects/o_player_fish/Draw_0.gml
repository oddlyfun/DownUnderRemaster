
// facing 
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
