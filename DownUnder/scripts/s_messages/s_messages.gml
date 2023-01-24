// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function add_message(the_message, the_type)
{
	var message_struct =
	{
		msg : the_message,
		typ : the_type
	};
	
	ds_queue_enqueue(global.message_q, message_struct );
}