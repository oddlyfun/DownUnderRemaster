draw_self();

// have to draw self in 'another place' because of screen wrap
// I need to know where I exist in those other places 

draw_sprite(sprite_index,image_index,x-room_width,y);
draw_sprite(sprite_index,image_index,x+room_width,y);