package com.webravenz.ld26.game.entities;
import com.webravenz.ld26.display.Entity;
import com.webravenz.ld26.game.Game;
import com.webravenz.ld26.game.SoundManager;
import com.webravenz.ld26.utils.AMath;
import nme.display.CapsStyle;
import nme.display.JointStyle;
import nme.display.LineScaleMode;

/**
 * ...
 * @author Webravenz
 */

class Bonus extends Entity
{
	
	private var _color:Int;
	private var _colorCode:Int;
	private var _rotationSpeed:Float;
	
	private var _SIZE = 12;

	public function new() 
	{
		super();
	}
	
	public function init():Void {
		_color = Math.random() < 0.5 ? 1 : 2;
		_colorCode = _color == 1 ? Game.COLOR1 : Game.COLOR2;
		_collideGroup = _color == 1 ? 2 : 1;
		
		x = AMath.random(20, Game.WIDTH - 20);
		y = -20;
		rotation = AMath.random(0, 90);
		_rotationSpeed = AMath.random(2, 5);
		if (Math.random() > 0.5) _rotationSpeed = -_rotationSpeed;
		
		setHitArea( -_SIZE, -_SIZE, _SIZE * 2, _SIZE * 2);
		
		_draw();
	}
	
	private override function _update():Void {
		_speedY = Game.speed;
		rotation += _rotationSpeed;
		super._update();
	}
	
	private function _draw() {
		var alt:Float = Math.sqrt(3) / 2 * _SIZE;
		
		graphics.lineStyle(3, _colorCode, 1, false, LineScaleMode.NONE, CapsStyle.SQUARE, JointStyle.MITER);
		graphics.moveTo(0, -alt / 2 - 1);
		graphics.lineTo( -_SIZE / 2, alt / 2 - 1);
		graphics.lineTo( _SIZE / 2, alt / 2 - 1);
		graphics.lineTo(0, -alt / 2 - 1);
	}
	
	public override function hit(power:Int):Void {
		if(_color == 1) SoundManager.sBonus.play();
		else SoundManager.sBonus2.play();
		super.hit(power);
	}
	
}