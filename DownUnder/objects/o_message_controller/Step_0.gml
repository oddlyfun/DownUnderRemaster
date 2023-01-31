
if ( ds_queue_size(global.message_q) > 0 )
{
	var _size = ds_list_size(alpha_list);
	// The message queue is made of structs not strings
	var _msg = ds_queue_dequeue(global.message_q);
	
	alpha_list[| _size] = 1.5;
	message_list[| _size] = _msg;
}


// reduce alpha

for( var i = 0; i  < ds_list_size(alpha_list); i++ )
{
	alpha_list[| i] = (alpha_list[| i] - ALPHA_DECAY);
	
	if ( alpha_list[| i] <= 0 )
	{
		ds_list_delete(alpha_list,i);
		ds_list_delete(message_list,i);
	}
}