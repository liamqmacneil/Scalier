/// @description ?
x = obj_b_player.x;
y = obj_b_player.y + 10;

image_angle = point_direction(x,y,mouse_x,mouse_y);

if(image_angle > 90) &&(image_angle < 270) {
	image_yscale = -1;
} else {
	image_yscale = 1;
}

if(mouse_check_button(mb_left)){
	
	
}