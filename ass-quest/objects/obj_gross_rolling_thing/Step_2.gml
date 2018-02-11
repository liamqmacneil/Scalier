/// @description ?
cooldown--;

if(place_meeting(x,y,obj_b_player)) && (cooldown < 0) {
	obj_b_player.hp -= dmg;
	cooldown = 60;
}

