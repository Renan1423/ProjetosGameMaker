if(place_free(x,y+grv) && !place_meeting(x,y+grv,obj_walls)){
	y+=grv;
}

if(place_free(x+hspd,y) && !place_meeting(x+hspd,y,obj_walls)){
	x += hspd;
}

life--;
if(life <= 0){
	instance_destroy();
}

getCooldown--;
if(getCooldown <= 0){
	getCooldown = 0;
}