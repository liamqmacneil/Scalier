if (selected = true) {
	var scaleAm = obj_scalier.scaleAm,scale = scaleAm;
	draw_sprite_stretched(sprite_index,0,x,y,sprite_width*scale,sprite_height*scale);
}else {
	draw_self();
}