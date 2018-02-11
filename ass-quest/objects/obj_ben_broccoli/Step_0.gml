/// @description ?
delay--;

if(place_meeting(x,y,obj_b_player)) {
	if(image_index != 1) {
		obj_b_player.hp += 1;
		delay = 10;
		consumed = true;
	}
	
}

if(consumed == true) {
	image_index = 1;
	if(delay <= 0) {
		instance_destroy();
	}
}

