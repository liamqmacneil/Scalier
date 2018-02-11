/// @description ?
if(place_meeting(x,y,obj_b_player)) {
	obj_b_player.hp -= 0.5;
	obj_b_player.hitfrom = direction;
	//obj_b_player.hsp = lengthdir_x(sign(hsp)*7,direction);
}