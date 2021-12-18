function collision_script_bottom(){
	mask = argument0;
	
	if !isDead && collision_circle(x + asin * mask, y + acos * mask, 3, obj_walls, true, true) return true;
	if !isDead && xlayer = 0 && collision_circle(x + asin * mask, y + acos * mask, 3, obj_bwalls, true, true) return true;
	if !isDead && xlayer = 1 && collision_circle(x + asin * mask, y + acos * mask, 3, obj_fwalls, true, true) return true;
	return false;
}