function collision_script_leftOnBar(){
	mask = argument0;
	
	if !isDead && collision_circle (x-(acos*mask) - asin*2,y + (asin*mask) - acos*2 , 3, obj_bar, true,true) return true;
	return false;
}