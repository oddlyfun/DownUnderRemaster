
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

if ( facing_dir != prev_facing )
{
	if ( swoosh == true )
	{
		audio_play_sound(sfx_swoosh_single, 1, false, global.SFX_GAIN);
		swoosh = false;
		alarm_set(0, game_get_speed(gamespeed_fps) );
	}
	prev_facing = facing_dir;
}




if ( ability_on == true )
{
	shader_set(shd_outline);
		draw_sprite_ext(sprite_index,image_index,x,y,facing_dir + (0.1 * facing_dir), y_scale + 0.1, direction-_correction,c_white,1);
	shader_reset();
}



if ( fish_id == 81 )
{
	shader_set(shd_color_caf);
		shader_set_uniform_f_array(uni_color,global.SHADER_COLOR);
		draw_sprite_ext(sprite_index,image_index,x,y,facing_dir, y_scale, direction-_correction,c_white,1);
	shader_reset();
} else
{
	draw_sprite_ext(sprite_index,image_index,x,y,facing_dir, y_scale, direction-_correction,c_white,1);
}



// Squirt Ability

