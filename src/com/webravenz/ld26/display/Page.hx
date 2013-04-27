package com.webravenz.ld26.display;
import com.eclecticdesignstudio.motion.Actuate;
import nme.events.Event;

/**
 * ...
 * @author Webravenz
 */

class Page extends ASprite
{
	
	public static var COMPLETE:String = 'PAGE_COMPLETE';
	
	public var targetPage:String;
	
	public function new() 
	{
		super();
	}
	
	private override function _onAddedToStage():Void {
		alpha = 0;
		scaleX = scaleY = 0.9;
		x = 18;
		y = 25;
		Actuate.tween(this, 0.5, { alpha: 1, scaleX: 1, scaleY: 1, x: 0, y: 0 } ).onComplete(_init);
	}
	
	private function _init():Void {
		
	}
	
	private function _hide():Void {
		Actuate.tween(this, 0.5, { alpha: 0, scaleX: 0.9, scaleY: 0.9, x: 18, y: 25 } ).onComplete(_hideComplete);
	}
	
	private function _hideComplete():Void {
		dispatchEvent(new Event(COMPLETE));
	}
	
}