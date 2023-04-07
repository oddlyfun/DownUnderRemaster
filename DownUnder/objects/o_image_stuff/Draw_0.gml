
var _size = 256;
var _sprite = sprite_list[index];
var _name = sprite_get_name(_sprite);


var _surf_NM = surface_create(_size,_size);
var _surf_GS = surface_create(_size,_size);

var _scale = 1;

for( var i = 1; i < 10; i++ )
{
	if ( i * sprite_get_width(_sprite) < _size )
	{
		_scale = i;
	}
}

// Normal
surface_set_target(_surf_NM);
	draw_clear_alpha(c_white,0);
	draw_sprite_ext(_sprite,0,_size/2,_size/2, _scale, _scale, 0, c_white, 1);
	surface_save(_surf_NM, _name + ".png");

surface_reset_target();


// Gray Scale
surface_set_target(_surf_GS);
draw_clear_alpha(c_white,0);
	shader_set(shd_gray_scale);
		draw_sprite_ext(_sprite,0,_size/2,_size/2, _scale, _scale, 0, c_white, 1);
	shader_reset();

surface_save(_surf_GS, _name + "_GS.png");

surface_reset_target();
//end


index++;

if (  index >= array_length(sprite_list) )
{
	instance_destroy();
}