/// @description ?
if(instance_exists(obj_b_player)) {
	xTo = follow.x;
	yTo = follow.y;
}

x += (xTo - x) / 25;
y += (yTo - y) / 25;

x = clamp(x,view_w_half,room_width-view_w_half);
y = clamp(y, view_h_half, room_height-view_h_half);

camera_set_view_pos(cam,x - view_w_half,y - view_h_half);

if(!instance_exists(obj_b_player)) exit;
if(obj_b_player.hp <= 0) {
	if (layer_exists("GUI")) {
		instance_create_layer(obj_b_player.x - 150, obj_b_player.y - 150,"GUI",obj_u_ded);
	}
	else {
		instance_create_layer(obj_b_player.x - 150, obj_b_player.y - 150,layerid,obj_u_ded);
	}
	
		
}

