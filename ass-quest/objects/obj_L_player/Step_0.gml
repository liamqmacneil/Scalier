hsp = 0;
switch (keyboard_key) {
	case vk_left:
		hsp = -spd;
	break;
	
	case vk_right:
		hsp = spd;
	break;
	
	case vk_up:
		vsp = -jmp;
	break;
}

if !(place_meeting(x+hsp,y,obj_wall)) {
	x += hsp;
}else {
	if !(place_meeting(x+sign(hsp),y,obj_wall)) {
		x+=sign(hsp);
	}
}

if !(place_meeting(x, y+vsp, obj_wall)) {
	y += vsp;
}else {
	if !(place_meeting(x, y+sign(vsp), obj_wall)) {
		y += sign(vsp)
	}
}

if (vsp < jmp) {
	vsp ++;
}
