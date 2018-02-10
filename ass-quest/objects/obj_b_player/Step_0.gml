/// @description ? Player moves
key_right = scr_input_const("D", vk_right);
key_left = scr_input_const("A",vk_left);

var move = key_right - key_left;

hsp = move * walksp;
vsp = vsp + grv;

if(scr_input_const(vk_space)) && place_meeting(x,y+1,obj_wall) {
	vsp = -7;
}

if(place_meeting(x+hsp,y,obj_wall)) {
	while(!place_meeting(x+sign(hsp),y,obj_wall)) {
		x = x + sign(hsp);
	}
	hsp = 0;
}

x = x + hsp;

if(place_meeting(x,y+vsp,obj_wall)) {
	while(!place_meeting(x,y+sign(vsp),obj_wall)) {
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;
	