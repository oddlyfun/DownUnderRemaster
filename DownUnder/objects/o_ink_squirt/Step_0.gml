if ( instance_exists(inst_attch) )
{
	x = inst_attch.x;
	y = inst_attch.y;
}


if ( !audio_is_playing(sfx_squirt_1) )
{
	audio_play_sound(sfx_squirt_1,10,false,global.SFX_GAIN);
}