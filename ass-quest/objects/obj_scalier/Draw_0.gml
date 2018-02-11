var oldCol = draw_get_color()
var transSurf = noone;
draw_set_color(c_white);
show_debug_message(hidden);

if (mouse_wheel_up()) {
	if (hidden = false) {
		scalePos0_x -= SCALE_CONST;
		scalePos0_y -= SCALE_CONST;
		scalePos1_x += SCALE_CONST;
		scalePos1_y += SCALE_CONST;
		update_sprite = true;
	}else {
		hidden = false;
		update_sprite = true;
	}
	
}
if (mouse_wheel_down()) {
	if (scalePos1_x-SCALE_CONST != scalePos0_x+SCALE_CONST) && (scalePos1_y-SCALE_CONST != scalePos0_y+SCALE_CONST) && (scalePos0_x+SCALE_CONST < scalePos1_x-SCALE_CONST) && (scalePos0_y+SCALE_CONST < scalePos1_y-SCALE_CONST) {
		scalePos0_x += SCALE_CONST;
		scalePos0_y += SCALE_CONST;
		scalePos1_x -= SCALE_CONST;
		scalePos1_y -= SCALE_CONST;
		update_sprite = true;
	}else {
		hidden = true;
	}
}


if !(surface_exists(scaleSurf)) {
	scaleSurf = surface_create(room_width,room_height);
}

if (mouse_check_button_pressed(mb_right)) {
	scaleCase = 0;
	instance_activate_all();
	obj_wall_scale.finished = false;
	obj_wall_scale.finishedTest = false;
	inst_scaleMask = noone;
	
	hidden = false;
	
	if (surface_exists(scaleDisplaySurf)) {
		surface_free(scaleDisplaySurf);
		scaleDisplaySurf = noone;
	}
	
	if (instance_exists(obj_scaleMask)) { instance_destroy(obj_scaleMask); }
	
	scaling = false;
	deactive = false;
	
	scalePos0_x = noone;
	scalePos0_y = noone;
	scalePos1_x = noone;
	scalePos1_y = noone;

	scaleView_x = noone;
	scaleView_y = noone;

	scaleSel_w = noone;
	scaleSel_h = noone;
	update_sprite = true;
}

switch (scaleCase) {
	case 0:
		if (mouse_check_button_pressed(mb_left)) {
			scaling = true;
			scalePos0_x = obj_mouse.x;
			scalePos0_y = obj_mouse.y;
			scaleCase = 1;
		}
	break;
	
	case 1:
		draw_rectangle(scalePos0_x,scalePos0_y,obj_mouse.x,obj_mouse.y,true);
		if (mouse_check_button_pressed(mb_left)) {
			scalePos1_x = obj_mouse.x;
			scalePos1_y = obj_mouse.y;
			if (scalePos1_x != scalePos0_x) && (scalePos1_y != scalePos0_y) && (scalePos0_x < scalePos1_x) && (scalePos0_y < scalePos1_y) {
				scaling = true;
				scaleCase = 2;
			
				scaleSel_w = scalePos1_x-scalePos0_x;
				scaleSel_h = scalePos1_y-scalePos0_y;
			
			
				scaleDefault0_x = scalePos0_x;
				scaleDefault0_y = scalePos0_y;
			
				scaleDefault1_x = scalePos1_x;
				scaleDefault1_y = scalePos1_y;
			}else {
				scalePos1_x = noone;
				scalePos1_y = noone;	
			}
		}
	break;
	
	case 2:
		scaling = false;
		deactive = true;
		if (scalePos1_x != scalePos0_x) && (scalePos1_y != scalePos0_y) && (hidden = false) {
			draw_rectangle(scalePos0_x,scalePos0_y,scalePos1_x,scalePos1_y,true);
			if !(surface_exists(scaleDisplaySurf)) {
				scaleDisplaySurf = surface_create(scaleSel_w,scaleSel_h);
			}

		
			if !(instance_exists(obj_scaleMask)) { inst_scaleMask = instance_create_depth(0,0,depth,obj_scaleMask); }
		
		
		
			inst_scaleMask.x = scalePos0_x; inst_scaleMask.y = scalePos0_y;
		
			surface_set_target(scaleDisplaySurf);
				draw_clear_alpha(c_red,0);
				draw_surface_part(scaleSurf		,scaleDefault0_x	,scaleDefault0_y	,scaleSel_w,	scaleSel_h, 0, 0);
			surface_reset_target();
		}
		
		transSurf = surface_create(surface_get_width(scaleSurf),surface_get_height(scaleSurf));
		surface_copy(transSurf,0,0,scaleSurf);
		
		surface_set_target(transSurf)
			gpu_set_blendmode(bm_subtract);
				draw_rectangle_color(scaleDefault0_x,scaleDefault0_y,scaleDefault0_x+scaleSel_w,scaleDefault0_y+scaleSel_h,c_white,c_white,c_white,c_white,false);
			gpu_set_blendmode(bm_normal);
		surface_reset_target()
		
		if (scalePos1_x != scalePos0_x) && (scalePos1_y != scalePos0_y)  && (hidden = false)  {
			if (update_sprite = true) {
				var surfW = (scalePos1_x-scalePos0_x), surfH = (scalePos1_y-scalePos0_y);
				var tempSurf = surface_create(surfW,surfH);
				if (sprite_exists(spr_scaleMask)) { sprite_delete(spr_scaleMask); }
		
				surface_set_target(tempSurf);
		
					draw_clear_alpha(c_black,0);
					draw_surface_stretched(scaleDisplaySurf,0,0,scalePos1_x-scalePos0_x,scalePos1_y-scalePos0_y);
					spr_scaleMask = sprite_create_from_surface(tempSurf,0,0,surfW,surfH,false,false,0,0);
			
				surface_reset_target();
				surface_free(tempSurf);
		
				sprite_collision_mask(spr_scaleMask,false,0,0,sprite_get_width(spr_scaleMask),0,sprite_get_height(spr_scaleMask),0,0);
				obj_scaleMask.sprite_index = spr_scaleMask;
				update_sprite = false;
			}
		}else {
			obj_scaleMask.sprite_index = noone;
		}
	break;
}
if (surface_exists(transSurf)) { 
	draw_surface(transSurf,0,0);
	surface_free(transSurf);
}else {
	draw_surface(scaleSurf,0,0);
}

//if (sprite_exists(spr_wallMask)) { sprite_delete(spr_wallMask); }

//var test = surface_create(room_width,room_height);

//surface_set_target(test);
//draw_clear_alpha(c_black,0);
//draw_surface(scaleSurf,0,0);
//spr_wallMask = sprite_create_from_surface(test,0,0,room_width,room_height,false,false,0,0);
//surface_reset_target();

//surface_free(test);

//sprite_collision_mask(spr_wallMask,false,0,0,sprite_get_width(spr_wallMask),0,sprite_get_height(spr_wallMask),0,0);
//obj_wallScaleMask.sprite_index = spr_wallMask;




//draw_text(0,0,sprite_get_width(spr_wallMask))
//draw_sprite(spr_wallMask,0,0,0);

//draw_surface(scaleSurf,0,0);









draw_set_color(oldCol);