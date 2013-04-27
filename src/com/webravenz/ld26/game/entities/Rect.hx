package com.webravenz.ld26.game.entities;
import com.webravenz.ld26.display.Entity;
import com.webravenz.ld26.game.Game;
import com.webravenz.ld26.game.SoundManager;
import nme.media.Sound;

/**
 * ...
 * @author Webravenz
 */

class Rect extends Entity
{
	
	private var _soundPlayed:Bool = false;
	private var _sound:Bool;

	public function new() 
	{
		super();
	}
	
	public function init(color:Int, posX:Int, posY:Int, width:Int, height: Int, sound:Bool):Void {
		
		_sound = sound;
		
		x = posX;
		y = posY;
		
		_collideGroup = color;
		
		setHitArea(0, 0, width, height);
		
		draw(color, width, height);
		
	}
	
	private override function _update():Void {
		_speedY = Game.speed;
		
		super._update();
		
		if (y > 430 && !_soundPlayed && _sound) {
			if (Game.playerColor == 1) {
				SoundManager.sKick.play();
			} else {
				SoundManager.sKick2.play();
			}
			_soundPlayed = true;
		}
		
		if (y > 500) {
			_destroy();
		}
	}
	
	private function draw(color:Int, width:Int, height:Int):Void {
		var colorCode = color == 1 ? Game.COLOR1 : Game.COLOR2;
		graphics.beginFill(colorCode);
		graphics.drawRect(0, 0, width, height);
		graphics.endFill();
	}
	
}