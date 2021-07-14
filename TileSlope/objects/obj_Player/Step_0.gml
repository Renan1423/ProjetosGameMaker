if(place_free(x,y+1)){
	y+=4;
}

if(keyboard_check(vk_right) && place_free(x+4,y)){
	x+=4;
}

else if(keyboard_check(vk_left) && place_free(x-4,y)){
	x-=4;
}

if(place_meeting(x,y,obj_Slope)){
	while(place_meeting(x,y,obj_Slope)){
		y--;
	}
}