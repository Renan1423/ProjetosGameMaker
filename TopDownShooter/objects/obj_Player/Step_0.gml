//image_angle = point_direction(x,y,mouse_x,mouse_y);

//if(keyboard_check(vk_up) && place_free(x,y + vspd)

if(keyboard_check(ord("D")) && place_free(x + hspd,y)){
	x+=hspd;
}
else if(keyboard_check(ord("A")) && place_free(x - hspd,y)){
	x-=hspd;
}
if(keyboard_check(ord("S")) && place_free(x,y + vspd)){
	y+=vspd;
}
else if(keyboard_check(ord("W")) && place_free(x,y - vspd)){
	y-=vspd;
}

if(mouse_check_button_pressed(mb_left)){

	//var xx = x + lengthdir_x(20, image_angle - 20);
	var xx = x + lengthdir_x(20,point_direction(x,y,mouse_x,mouse_y) - 20);
	var yy = y + lengthdir_y(20,point_direction(x,y,mouse_x,mouse_y) - 20);

	var bullet = instance_create_depth(xx,yy,-1,obj_Bullet);
	
	//bullet.direction = image_angle;
	bullet.direction = point_direction(x,y,mouse_x,mouse_y);
	bullet.speed = 10;
	
}

if(life <= 0){
	room_restart();
}
