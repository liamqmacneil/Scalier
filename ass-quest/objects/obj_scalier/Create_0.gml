if(!instance_exists(obj_mouse)) {
	instance_create_depth(x,y,depth,obj_mouse);
}

scaleSurf = noone;
scaleDisplaySurf = noone;
scaling = false;

scaleCase = 0;
scaleAm = 1;
SCALE_CONST = 40;

scalePos0_x = noone;
scalePos0_y = noone;

scalePos1_x = noone;
scalePos1_y = noone;

scaleDefault0_x = noone;
scaleDefault0_y = noone;

scaleDefault1_x = noone;
scaleDefault1_y = noone;

spr_wallMask = noone;
spr_scaleMask = noone;
inst_scaleMask = noone;
deactive = false;

hidden = false;

update_sprite = true;

instance_create_depth(0,0,depth,obj_wallScaleMask);
//show_debug_overlay(true);