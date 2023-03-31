
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


if ( fish_id == 81 )
{
	shader_set(shd_color_caf);
		shader_set_uniform_f_array(uni_color,global.SHADER_COLOR);
		draw_sprite_ext(sprite_index,image_index,x,y,facing_dir,1, direction-_correction,c_white,1);
	shader_reset();
} else
{
	draw_sprite_ext(sprite_index,image_index,x,y,facing_dir,1, direction-_correction,c_white,1);
}