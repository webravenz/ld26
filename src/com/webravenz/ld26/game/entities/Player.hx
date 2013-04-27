package com.webravenz.ld26.game.entities;
import com.webravenz.ld26.display.Entity;
import com.webravenz.ld26.game.Controls;
import com.webravenz.ld26.game.Game;
import com.webravenz.ld26.utils.AMath;
import nme.events.Event;

/**
 * ...
 * @author Webravenz
 */

class Player extends Entity
{
	private var _SPEEDMAX:Float = 8;
	private var _ACCELERATION:Float = 1;
	private var _SIZE:Int = 12;
	
	private var _color:Int;
	private var _colorCode:Int;

	public function new() 
	{
		super();
	}
	
	private override function _onAddedToStage():Void {
		
		super._onAddedToStage();
		
		x = 175;
		y = 450;
		
		_speedY = 0;
		_speedX = 0;
		collisionCheck = true;
		
		_color = _collideGroup = 1;
		_colorCode = Game.COLOR1;
		draw();
		
		Game.controls.addEventListener(Controls.SPACE, _swapColor);
		
	}
	
	private override function _onRemovedFromStage():Void {
		
		super._onRemovedFromStage();
		
		Game.controls.removeEventListener(Controls.SPACE, _swapColor);
		
	}
	
	public override function _update():Void {
		
		if (Game.controls.left())       _speedX -= _ACCELERATION;
		else if (Game.controls.right()) _speedX += _ACCELERATION;
		else                        _speedX /= 2;
		
		_speedX = AMath.limite(_speedX, -_SPEEDMAX, _SPEEDMAX);
		
		super._update();
		
		x = AMath.limite(x, _SIZE, 350 - _SIZE);
		
	}
	
	private function draw():Void {
		_collideGroup = _color;
		graphics.beginFill(_colorCode);
		graphics.drawCircle(0, 0, _SIZE);
		graphics.endFill();
	}
	
	private function _swapColor(e:Event):Void {
		if (_color == 1) {
			_color = _collideGroup = 2;
			_colorCode = Game.COLOR2;
		} else {
			_color = _collideGroup = 1;
			_colorCode = Game.COLOR1;
		}
		draw();
	}
	
}