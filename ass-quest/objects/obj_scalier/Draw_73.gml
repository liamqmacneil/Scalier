var oldCol = draw_get_color()
draw_set_color(c_black)

if (mouse_wheel_up()) {
	scaleAm += 0.05;
}

if (mouse_wheel_down()) {
	scaleAm -= 0.05;
}



#region Remove Box
if (mouse_check_button_pressed(mb_right)) {
	scalePoint0_x = noone;
	scalePoint0_y = noone;

	scalePoint1_x = noone;
	scalePoint1_y = noone;

	scalePointState = 0;
	
	scaleAm = 1;
	scaling = false;
	
	surface_free(scaleSurf);
}
#endregion

if (mouse_check_button_pressed(mb_left)) {
	if (scalePoint0_x = noone) {
		scalePoint0_x = obj_mouse.x;
		scalePoint0_y = obj_mouse.y;
		scalePointState = 1;
		scaling = true;
	}else {
		scalePoint1_x = obj_mouse.x;
		scalePoint1_y = obj_mouse.y;
		scalePointState = 2;
		scaling = false;
	}
}

switch (scalePointState) {
	case 1:
		draw_rectangle(scalePoint0_x,scalePoint0_y,obj_mouse.x,obj_mouse.y,true);
	break;
	case 2:
		draw_rectangle(scalePoint0_x-1,scalePoint0_y-1,scalePoint1_x,scalePoint1_y,true);
		var surfW, surfH
		surfW = scalePoint1_x-scalePoint0_x;
		surfH = scalePoint1_y-scalePoint0_y;
		if !(surface_exists(scaleSurf)) {
			scaleSurf = surface_create(surfW,surfH);
		}
		surface_copy_part(scaleSurf,0,0,application_surface,scalePoint0_x,scalePoint0_y,surfW,surfH);
		show_debug_message("W: "+string(surface_get_width(application_surface))+" H: "+string(surface_get_height(application_surface)));
		draw_surface_ext(scaleSurf,scalePoint0_x,scalePoint0_y,scaleAm,scaleAm,0,c_yellow,1);
	break;
}
draw_set_color(oldCol)











