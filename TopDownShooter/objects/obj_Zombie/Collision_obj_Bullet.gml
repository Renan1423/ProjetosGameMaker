
if(enemyLife > 0){
	enemyLife--;
	sprite_index = spr_EnemyDamage;
	alarm[0] = 10;
}
instance_destroy(obj_Bullet);