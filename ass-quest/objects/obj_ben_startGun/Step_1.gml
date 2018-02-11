/// @description ?

if(place_meeting(x,y,obj_b_player)) {
	attachedToPlayer = true;
}
if(attachedToPlayer != true) exit;

x = obj_b_player.x;
y = obj_b_player.y + 10;

image_angle = point_direction(x,y,mouse_x,mouse_y);

if(image_angle > 90) &&(image_angle < 270) {
	image_yscale = -1;
} else {
	image_yscale = 1;
}

firingDelay = firingDelay - 1;

if(mouse_check_button(mb_left) && firingDelay <= 0){
	
	firingDelay = 10;
		with(instance_create_layer(x,y,"bullet_layer",obj_ben_bullet)) {
		
		speed = 25;
		direction = other.image_angle;
		image_angle = direction;
	}
	
	
	
}