/// @description ?
if(instance_exists(obj_b_player)) {
	xTo = follow.x;
	yTo = follow.y;
}

x += (xTo - x) / 25;
y += (yTo - y) / 25;

camera_set_view_pos(cam,x - view_w_half,y - view_h_half);

