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
	public static var sDeath:Sound;
	public static var sSpace:Sound;

	public function new() 
	{
		sKick = Assets.getSound('assets/sound/hard_kick.wav');
		sKick2 = Assets.getSound('assets/sound/snare_stick.wav');
		sBonus = Assets.getSound('assets/sound/hh_frappe1.wav');
		sBonus2 = Assets.getSound('assets/sound/hh_ferm.wav');
		sDeath = Assets.getSound('assets/sound/ride_bord.wav');
		sSpace = Assets.getSound('assets/sound/snare_fla.wav');
	}
	
}