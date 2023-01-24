// loading the sea life json data
global.all_life = undefined;
global.all_life_json_filename = "sea_life.json";

if ( file_exists(global.all_life_json_filename))
{
	var _buffer = buffer_load(global.all_life_json_filename);
	var _string = buffer_read(_buffer, buffer_string);
	
	global.all_life = json_parse(_string);
}


#macro WARN = "warning";
#macro INFO = "info";
#macro ERROR = "error";
global.message_q = ds_queue_create();