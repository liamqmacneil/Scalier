/// @description Insert description here
// You can write your code in this editor
hsp = dir * movespeed;
vsp += grav;
#region//Horizontal Collision
if(place_meeting(x+hsp,y,obj_wall)) {
	while(!place_meeting(x+sign(hsp),y,obj_wall)) {
		x += sign(hsp);
	}
	hsp = 0;
	dir *= -1;
} else if(!place_meeting(x+hsp,y+1,obj_wall)) {
	hsp = 0;
	dir *= -1;
}

if(place_meeting(x,y,obj_wall)) {
	instance_destroy();
}


x += hsp;
#endregion
#region //Verticle Collision
if(place_meeting(x,y+vsp,obj_wall)) {
	while(!place_meeting(x,y+sign(vsp),obj_wall)) {
		y = y + sign(vsp);
	}
	vsp = 0;
}
y += vsp;
#endregion


#region // Main Player Collision

if(place_meeting(x,y+vsp,obj_b_player)) {
	if(obj_b_player.y < y-16)
	{
		with(obj_b_player) vsp = -walksp;
		instance_destroy();
	}
	
}
#endregion

cooldown--;

if(place_meeting(x,y,obj_b_player)) && (cooldown < 0) {
	cooldown = 120;
	obj_b_player.hp -= 1;
	obj_b_player.hitfrom = direction;
	//obj_b_player.hsp = lengthdir_x(sign(hsp)*7,direction);
}