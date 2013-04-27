package com.webravenz.ld26.game.entities;
import com.webravenz.ld26.display.Entity;
import com.webravenz.ld26.game.Game;

/**
 * ...
 * @author Webravenz
 */

class Rect extends Entity
{

	public function new() 
	{
		super();
	}
	
	public function init(color:Int, posX:Int, posY:Int, width:Int, height: Int):Void {
		
		x = posX;
		y = posY;
		
		_collideGroup = color;
		
		setHitArea(0, 0, width, height);
		
		draw(color, width, height);
		
	}
	
	private override function _update():Void {
		_speedY = Game.speed;
		
		super._update();
		
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