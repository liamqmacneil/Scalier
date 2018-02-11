/// @description ? Set up the object
//horizantal speed
hsp = 0;
//vertical speed
vsp = 0;
//gravity
grv = 0.3;
//walking speed
walksp = 4;
//acceleration
acl = 0.2;

//health points
hp = 10;

//direction where we were hit from
hitfrom = 0;

//the health from before
healthPrevious = hp;

//the hit delay
hitdelay = 0;

//falltimer
falltimer = 0;

if(!layer_exists("player_layer")) layer_create(0,"player_layer");