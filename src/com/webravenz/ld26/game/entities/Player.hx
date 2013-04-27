package com.webravenz.ld26.game.entities;
import com.webravenz.ld26.display.Entity;
import com.webravenz.ld26.game.Controls;
import com.webravenz.ld26.game.Game;
import com.webravenz.ld26.game.SoundManager;
import com.webravenz.ld26.utils.AMath;
import nme.display.CapsStyle;
import nme.display.JointStyle;
import nme.display.LineScaleMode;
import nme.events.Event;

/**
 * ...
 * @author Webravenz
 */

class Player extends Entity
{
	private var _SPEEDMAX:Float = 8;
	private var _ACCELERATION:Float = 1;
	private var _SIZE:Int = 16;
	
	private var _color:Int;
	private var _colorCode:Int;
	private var _soundPlayed:Bool = false;
	
	public var lose = false;
	
	private var _game:Game;

	public function new(game:Game) 
	{
		_game = game;
		super();
	}
	
	private override function _onAddedToStage():Void {
		
		super._onAddedToStage();
		
		x = 175;
		y = 450;
		
		_speedY = 0;
		_speedX = 0;
		collisionCheck = true;
		
		var hitSize:Int = Math.round(_SIZE * 0.8);
		setHitArea(-hitSize / 2, -hitSize / 2, hitSize, hitSize);
		
		_color = _collideGroup = 1;
		_colorCode = Game.COLOR1;
		draw();
		
		Game.controls.addEventListener(Controls.SPACE, _swapColor);
		
	}
	
	private override function _onRemovedFromStage():Void {
		
		super._onRemovedFromStage();
		
		Game.controls.removeEventListener(Controls.SPACE, _swapColor);
		
	}
	
	private override function _update():Void {
		
		if (Game.controls.left())       _speedX -= _ACCELERATION;
		else if (Game.controls.right()) _speedX += _ACCELERATION;
		else                        _speedX /= 2;
		
		_speedX = AMath.limite(_speedX, -_SPEEDMAX, _SPEEDMAX);
		
		super._update();
		
		x = AMath.limite(x, _SIZE, 350 - _SIZE);
		
		if (_soundPlayed && collides.length == 0) _soundPlayed = false;
		
	}
	
	private function draw():Void {
		_collideGroup = _color;
		
		graphics.clear();
		graphics.lineStyle(4, _colorCode, 1, false, LineScaleMode.NORMAL, CapsStyle.SQUARE, JointStyle.MITER);
		if (_color == 1) {
			graphics.moveTo( -_SIZE, -_SIZE);
			graphics.lineTo( -_SIZE, _SIZE);
			graphics.lineTo( _SIZE, _SIZE);
			graphics.lineTo( _SIZE, -_SIZE);
			graphics.lineTo( -_SIZE, -_SIZE);
		} else {
			graphics.drawCircle(0, 0, _SIZE);
		}
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
	
	private override function _checkCollisions():Void {
		for (entity in collides) {
			if (Std.is(entity, Bonus)) {
				_game.addScore(2);
				entity.hit(100);
			} else if (Std.is(entity, Rect)) {
				var rect:Rect = cast(entity, Rect);
				if(rect.color != _color) {
					lose = true;
				} else {
					if (!_soundPlayed) {
						_soundPlayed = true;
						
						if (_color == 1) {
							SoundManager.sKick.play();
						} else {
							SoundManager.sKick2.play();
						}
					}
				}
			}
		}
	}
	
}