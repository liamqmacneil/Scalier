if(place_meeting(x,y,obj_wall)) {
	instance_destroy();
}

if(place_meeting(x,y,obj_b_player)) {
	with(obj_b_player) {
		hp--;
		hitfrom = other.direction;
	}
	visible = false;
}