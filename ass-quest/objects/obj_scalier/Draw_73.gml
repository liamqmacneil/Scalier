var oldCol = draw_get_color()
draw_set_color(c_black)

if (mouse_wheel_up()) {
	scaleAm ++;
}

if (mouse_wheel_down()) {
	scaleAm --;
}

#region
	if (mouse_check_button_pressed(mb_right)) {
		scaling = false;
		scalePoint0_x = noone;
		scalePoint0_y = noone;

		scalePoint1_x = noone;
		scalePoint1_y = noone;
		
		scalePointState = 0;
	}
#endregion



switch (scalePointState) {
	
	case 0:
		if (mouse_check_button_pressed(mb_left)) {
			scalePointState = 1;
			scalePoint0_x = obj_mouse.x;
			scalePoint0_y = obj_mouse.y;
			scaling = true;
		}
	break;
	
	case 1:
		draw_rectangle(scalePoint0_x,scalePoint0_y,obj_mouse.x,obj_mouse.y,true);
		if (mouse_check_button_pressed(mb_left)) {
			scalePointState = 2;
			scalePoint1_x = obj_mouse.x;
			scalePoint1_y = obj_mouse.y;
		}
	break;
	
	case 2:
		draw_rectangle(scalePoint0_x,scalePoint0_y,scalePoint1_x,scalePoint1_y,true);
		if (instance_exists(obj_wall_scale)) {
			obj_wall_scale.scaleSelectTest = true;
		}
		scaling = false;
		scalePointState = 3;
	break;

	case 3:
		draw_rectangle(scalePoint0_x-(scaleAm*40),scalePoint0_y-(scaleAm*40),scalePoint1_x+(scaleAm*40),scalePoint1_y+(scaleAm*40),true);
	break;
}


draw_set_color(oldCol)











