function collision_script_left_line(){
	mask = argument0;
	line = floor(mask*2.5);
	
	if !isDead && collision_line(x-(acos*mask)+(asin*mask),y+(asin*mask)+(acos*mask),x-(acos*mask)+(asin*line),y+(asin*mask)+(acos*line),obj_walls,true,true) return true;
	if !isDead && xlayer = 0 && collision_line(x-(acos*mask)+(asin*mask),y+(asin*mask)+(acos*mask),x-(acos*mask)+(asin*line),y+(asin*mask)+(acos*line),obj_bwalls,true,true) return true;
	if !isDead && xlayer = 1 && collision_line(x-(acos*mask)+(asin*mask),y+(asin*mask)+(acos*mask),x-(acos*mask)+(asin*line),y+(asin*mask)+(acos*line),obj_fwalls,true,true) return true;
	return false;
}