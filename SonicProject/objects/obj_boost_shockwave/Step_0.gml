if(obj_player.isBoosting = false){
	obj_player.boostCount = 0;
}

if(obj_player.isStomping = true){
	image_angle = 90;
}

x = obj_player.x;
y = obj_player.y;

if(!obj_player.isStomping){
	image_angle = obj_player.angle;
	image_xscale = -(obj_player.xdir);
}


