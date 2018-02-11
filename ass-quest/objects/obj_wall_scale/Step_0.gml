if (scaleSelectTest = true) {
	scaleSelectTest = false;
	var sX_0,sY_0,sX_1,sY_1;
	sX_0 = obj_scalier.scalePoint0_x;
	sY_0 = obj_scalier.scalePoint0_y;
	sX_1 = obj_scalier.scalePoint1_x;
	sY_1 = obj_scalier.scalePoint1_x;
	if (point_in_rectangle(x,y,sX_0,sY_0,sX_1,sY_1)) {
		selected = true;
	}
}


if (selected = true) {
	var scaleAm = obj_scalier.scaleAm,scale = ((scaleAm-1)*10);
	
	var xDif,yDif,sPos0_x,sPos0_y,sPos0_dx,sPos0_dy;
	sPos0_x = obj_scalier.scalePoint0_x;
	sPos0_y = obj_scalier.scalePoint0_y;
	sPos0_dx = obj_scalier.scalePoint0_x_d;
	sPos0_dy = obj_scalier.scalePoint0_y_d;
	
	xDif = defaultX-sPos0_dx;
	yDif = defaultY-sPos0_dy;
	
	
	
	x = sPos0_x+(xDif);
	y = sPos0_y+(yDif);
}





if (mouse_check_button_pressed(mb_right)) {
	selected = false;
	image_xscale = 1;
	image_yscale = 1;
	x = defaultX;
	y = defaultY;
}