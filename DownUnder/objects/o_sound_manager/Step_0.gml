if ( audio_group_is_loaded(MainMusic) )
{
	var _music_playing = false;
	var _len = array_length(all_music);

	for (var i = 0; i < _len; i += 1)
	{
	    var _music = all_music[@ i];
	    if ( audio_is_playing(_music) ) 
	    {
	        _music_playing = true;
	        break;
	    }   
	}

	if ( _music_playing == false )
	{
	    var _r = irandom_range(0,_len - 1);
	    audio_play_sound(all_music[_r], 10, false, global.MUSIC_GAIN);
		show_debug_message(string(_r) + " Music Index is playing");
	}
}