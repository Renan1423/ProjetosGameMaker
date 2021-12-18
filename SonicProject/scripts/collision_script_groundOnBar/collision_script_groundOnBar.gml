function collision_script_groundOnBar(){
	mask = argument0;
	
	if !isDead && collision_circle(x-asin*(mask*1.5),y+acos*(mask*1.5),3,obj_bar,true,true) return true;
	return false;
}