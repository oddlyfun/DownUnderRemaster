
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


draw_sprite_ext(sprite_index,image_index,x,y,facing_dir,1, direction-_correction,c_white,1);


	
	//var _half_sprite = sprite_width / 2;
	//var _mouth_x = x + lengthdir_x(_half_sprite,direction);
	//var _mouth_y = y + lengthdir_y(_half_sprite,direction);
	
	//draw_circle_color(_mouth_x,_mouth_y, 2, c_red, c_red, false);