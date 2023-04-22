/*
Texture Group - texture_other
Texture Group - Default
Texture Group - tex_grass
Texture Group - texture_fish
*/

fish_texts = texturegroup_get_sprites("texture_fish");
other_texts = texturegroup_get_sprites("texture_other");
grass_texts = texturegroup_get_sprites("tex_grass");
default_texts = texturegroup_get_sprites("Default");

pre_load_array = [
	fish_texts,
	other_texts,
	grass_texts,
	default_texts,
];


main_index = 0;
sub_index = 0;
finished_loading = false;