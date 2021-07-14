//image_angle = point_direction(x,y,obj_Player.x,obj_Player.y);
//direction = image_angle;

mp_potential_step(obj_Player.x,obj_Player.y,2,true);

if(place_meeting(x,y,obj_Player)){
	obj_Player.life--;
	obj_Player.sprite_index = spr_PlayerDamage;
	obj_Player.alarm[0] = 10;
}

if(enemyLife <= 0){
	instance_destroy();
}