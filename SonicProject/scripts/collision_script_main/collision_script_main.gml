function collision_script_main(){
	mask = argument0;
	
	if !isDead && collision_circle(x,y,mask,obj_walls,true,true) return true;
	if !isDead && xlayer = 0 && collision_circle(x,y,mask,obj_bwalls,true,true) return true;
	if !isDead && xlayer = 1 && collision_circle(x,y,mask,obj_fwalls,true,true) return true;
	return false;
}