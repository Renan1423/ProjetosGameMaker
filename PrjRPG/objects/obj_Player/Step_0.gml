
//sprite_index = spr_Player;

if(keyboard_check(ord("W")) && place_free(x,y-spd)){
	y-=spd;
}

else if(keyboard_check(ord("S")) && place_free(x,y+spd)){
	y+=spd;
}

if(keyboard_check(ord("A")) && place_free(x-spd,y)){
	x-=spd;
	image_xscale = -1;
}

else if(keyboard_check(ord("D")) && place_free(x+spd,y)){
	x+=spd;
	image_xscale = 1;
}

camera_set_view_pos(view_camera[0],x - view_wport[0]/2, y - view_hport[0]/2);
depth = -y;

if(place_meeting(x,y,obj_Enemy)){
	if(life > 0){
		life--;
		if(irandom(100) < 20)
		audio_play_sound(snd_Hurt,1,false);
	}else{
		room_restart();
	}
}

if(mouse_check_button_pressed(mb_left)){
	var flecha = instance_create_depth(x,y,1,obj_Arrow);
	//flecha.hspeed = 4;
	flecha.image_angle = point_direction(x,y,mouse_x,mouse_y);
	flecha.direction = point_direction(x,y,mouse_x,mouse_y);
	flecha.speed = 7;
}

if(instance_number(obj_Enemy) == 0){
	//room_goto_next();
	room_goto(rm_02);
}