/// @description Global Right Mouse Button Released
// You can write your code in this editor


// Prevent this pop up from happening if the level is over
if ( global.LEVEL_OVER == true ) then exit;

if ( show_display )
{
	show_display = false;
	global.PAUSED = false;
} else
{
	show_display = true;
	global.PAUSED = true;
}
