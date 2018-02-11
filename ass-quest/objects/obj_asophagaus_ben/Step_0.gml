/// @description ? 
left_max = xBeg - left_add;
right_max = xBeg + right_add;
x = x + hsp;
if(x + hsp == left_max) {
    hsp = 1;
} else if(x + hsp == right_max) {
    hsp = -1;
}
if(place_meeting(x,y-1,obj_b_player)) {
    obj_b_player.x += hsp;
}