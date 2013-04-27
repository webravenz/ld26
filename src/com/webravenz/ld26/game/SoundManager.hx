package com.webravenz.ld26.game;
import nme.Assets;
import nme.media.Sound;

/**
 * ...
 * @author Webravenz
 */

class SoundManager 
{
	
	public static var sKick:Sound;
	public static var sKick2:Sound;
	public static var sBonus:Sound;
	public static var sBonus2:Sound;

	public function new() 
	{
		sKick = Assets.getSound('assets/sound/hard_kick.wav');
		sKick2 = Assets.getSound('assets/sound/snare_stick.wav');
		sBonus = Assets.getSound('assets/sound/hh_frappe1.wav');
		sBonus2 = Assets.getSound('assets/sound/hh_frappe2.wav');
	}
	
}