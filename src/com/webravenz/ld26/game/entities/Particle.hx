package com.webravenz.ld26.game.entities;
import com.webravenz.ld26.display.Entity;
import com.webravenz.ld26.game.Game;
import com.webravenz.ld26.utils.AMath;

/**
 * ...
 * @author Webravenz
 */

class Particle extends Entity
{
	
	private var _shape:String;
	private var _alphaChange:Float;
	private var _colorCode:Int;

	public function new(colorCode:Int, shape:String, posX:Float, posY: Float, speedX:Float, speedY:Float, alphaChange:Float) 
	{
		super();
		
		_speedX = speedX;
		_speedY = speedY;
		_colorCode = colorCode;
		
		x = posX;
		y = posY;
		
		_shape = shape;
		_alphaChange = alphaChange;
		
		_draw();
	}
	
	private override function _update():Void {
		super._update();
		
		_speedX *= 0.9;
		_speedY *= 0.8;
		
		alpha -= _alphaChange;
		if (alpha <= 0) {
			_destroy();
		}
	}
	
	private function _draw():Void {
		
		graphics.beginFill(_colorCode);
		
		switch(_shape) {
			case 'rect' :
				graphics.drawRect( -4, -4, 8, 8);
			case 'circle' :
				graphics.drawCircle(0, 0, 4);
			case 'triangle' :
				graphics.moveTo( -4, 1.7);
				graphics.lineTo(4, 1.7);
				graphics.lineTo(0, -1.7);
				graphics.lineTo(-4, 1.7);
		}
		
		graphics.endFill();
		rotation = AMath.random(0, 360);
		scaleX = scaleY = AMath.random(0.5, 1);
	}
	
}