if(place_meeting(x,y,obj_wall)) {
	instance_destroy();
}

if(place_meeting(x,y,obj_b_player)) {
	with(obj_b_player) {
		hp -= 1;;
		hitfrom = other.direction;
		
	}
	
	instance_destroy();

}