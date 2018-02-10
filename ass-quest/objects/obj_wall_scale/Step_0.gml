if (scaleSelectTest = true) {
	scaleSelectTest = false;
	var sX_0,sY_0,sX_1,sY_1;
	sX_0 = obj_scalier.scalePoint0_x;
	sY_0 = obj_scalier.scalePoint0_y;
	sX_1 = obj_scalier.scalePoint1_x;
	xY_1 = obj_scalier.scalePoint1_x;
	if (point_in_rectangle(x,y,sX_0,sY_0,sX_1,sY_1)) {
		selected = true;
	}
}


if (selected = true) {
	var scaleAm = obj_scalier.scaleAm;
	
}





if (mouse_check_button_pressed(mb_right)) {
	selected = false;
}