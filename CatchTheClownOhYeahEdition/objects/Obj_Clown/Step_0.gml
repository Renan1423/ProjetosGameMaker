//x+=dx*spd;
//y+=dy*spd;
//image_angle = angle;
if(!place_meeting(x+(dx*spd),y,Obj_Box)){
	x+= dx*spd;
}else{
	dx *= -1;
}
if(!place_meeting(x,y+(dy*spd),Obj_Box)){
	y+= dy*spd;
}else{
	dy *= -1;
}
image_angle = point_direction(xprevious,yprevious,x,y);



//if(place_meeting(x,y,Obj_Box)){
//	direction = random(360);
//	speed = irandom_range(2,8);
//}