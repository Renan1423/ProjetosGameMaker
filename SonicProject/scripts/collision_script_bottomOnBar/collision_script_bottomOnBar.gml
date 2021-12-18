function collision_script_bottomOnBar(){
	mask = argument0;
	
	if !isDead && collision_circle(x + asin * mask, y + acos * mask, 3, obj_bar, true, true) return true;
	return false;
}