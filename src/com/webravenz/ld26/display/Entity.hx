package com.webravenz.ld26.display;
import com.webravenz.ld26.events.EntityEvent;
import nme.display.Sprite;
import nme.geom.Rectangle;

/**
 * ...
 * @author Webravenz
 */

class Entity extends ASprite
{
	
	private var _speedX:Float = 0;
	private var _speedY:Float = 0;
	
	private var _displayed:Bool = false;
	private var _life:Int = 100;
	
	// collisions
	private var _collideGroup:Int = 0;
	public var collides:Array<Entity> = null;
	private var _area:Rectangle;
	public var collisionCheck:Bool = false;
	
	public function new() 
	{
		super();
	}
	
	private override function _onAddedToStage():Void {
		
		_displayed = true;
		
	}
	
	private override function _onRemovedFromStage():Void {
		
		_displayed = false;
		
	}
	
	// update call each frame
	public function update():Void {
		
		if (_displayed) {
			_update();
		}
		
	}
	
	private function _update():Void {
		
		x += _speedX;
		y += _speedY;
		
	}
	
	// check collisions with other entities
	public function checkCollisions():Void {
		
		if (collides != null && collides.length > 0) {
			
			_checkCollisions();
			
		}
		
	}
	
	private function _checkCollisions():Void
	{
		
	}
	
	private function _destroy():Void {
		
		dispatchEvent(new EntityEvent(EntityEvent.DESTROYED));
		
	}
	
	// lose life, if 0 you're dead bastard
	public function hit(power:Int):Void {
		
		_life -= power;
		
		if (_life <= 0) {
			
			_collideGroup = 0;
			_destroy();
			
		}
		
	}
	
	// set collide area
	private function setHitArea(ax:Float, ay:Float, aw:Int, ah:Int):Void {
		
		_area = new Rectangle(ax, ay, aw, ah);
		
	}
	
	// getters
	
	public function getCollideGroup():Int {
		return _collideGroup;
	}
	
	public function getArea():Rectangle {
		return new Rectangle(x + _area.x, y + _area.y, _area.width, _area.height);
	}
	
}