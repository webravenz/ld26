package com.webravenz.ld26.utils;

/**
 * ...
 * @author Webravenz
 */

class AMath 
{
	
	public static function limite(val:Float, min:Float, max:Float):Float {
		
		return val < min ? min : val > max ? max : val;
		
	}
	
	public static function random(min:Float, max:Float):Float {
		
		return Math.random() * (max - min) + min;
		
	}
	
}