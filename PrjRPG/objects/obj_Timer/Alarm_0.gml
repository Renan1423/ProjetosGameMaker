if(instance_number(obj_Enemy) < 10){
	var enemyx = irandom_range(64,room_width - 64);
	var enemyy = irandom_range(64,room_height - 64);
	while(!place_free(enemyx,enemyy)){
		var enemyx = irandom_range(64,room_width - 64);
		var enemyy = irandom_range(64,room_height - 64);
	}
	if(place_free(enemyx,enemyy)){
		var obj = instance_create_depth(enemyx,enemyy,-1,obj_Enemy);
		obj.sprite_index = choose(spr_Zombie,spr_Zombie2);
		alarm[0] = irandom_range(60,600);
	}
}