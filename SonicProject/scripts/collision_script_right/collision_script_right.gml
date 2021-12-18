function collision_script_right(){
	mask = argument0;
	
	if !isDead && collision_circle(x+(acos*mask) - asin*2, y-(asin*mask) - acos*2,3,obj_walls,true,true) return true;
	if !isDead && xlayer = 0 && collision_circle(x+(acos*mask) - asin*2, y-(asin*mask) - acos*2,3,obj_bwalls,true,true) return true;
	if !isDead && xlayer = 1 && collision_circle(x+(acos*mask) - asin*2, y-(asin*mask) - acos*2,3,obj_fwalls,true,true) return true;
	return false;
}