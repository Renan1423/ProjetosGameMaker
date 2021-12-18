if(place_free(x,y+grv) && !place_meeting(x,y+grv,obj_walls)){
	y+=grv;
}

if(place_free(x+hspd,y) && !place_meeting(x+hspd,y,obj_walls)){
	x += hspd;
	hMoveCount += hspd;
}

if(abs(hMoveCount) >= hMoveLimit){
	hspd = hspd * -1;
	image_xscale = hspd;
}