/// @description ?
gracePeriod--;

if(place_meeting(x,y,obj_b_player)) && (gracePeriod <= 0) {
	obj_b_player.hp -= 2;
	gracePeriod = 60;
}

show_debug_message(gracePeriod);