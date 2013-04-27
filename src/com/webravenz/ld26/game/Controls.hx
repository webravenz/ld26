package com.webravenz.ld26.game;
import nme.display.Stage;
import nme.events.Event;
import nme.events.EventDispatcher;
import nme.events.KeyboardEvent;
import nme.ui.Keyboard;

/**
 * ...
 * @author Webravenz
 */

class Controls extends EventDispatcher
{
	public static var SPACE:String = 'CONTROL_SPACE';
	
	private var _stage:Stage;
	
	// keyboard
	private var _left:Bool = false;
	private var _right:Bool = false;

	public function new(stage:Stage) 
	{
		super();
		_stage = stage;
	}
	
	// event listeners
	
	private function _onKeyDown(e:KeyboardEvent):Void 
	{
		switch(e.keyCode) {
			
			case Keyboard.LEFT :
				_left = true;
			case Keyboard.RIGHT :
				_right = true;
			case Keyboard.SPACE :
				dispatchEvent(new Event(SPACE));
			
		}
	}
	
	private function _onKeyUp(e:KeyboardEvent):Void 
	{
		switch(e.keyCode) {
			
			case Keyboard.LEFT :
				_left = false;
			case Keyboard.RIGHT :
				_right = false;
			
		}
		
	}
	
	// start / stop
	
	public function start():Void {
		
		_stage.addEventListener(KeyboardEvent.KEY_DOWN, _onKeyDown);
		_stage.addEventListener(KeyboardEvent.KEY_UP, _onKeyUp);
		
	}
	
	public function stop():Void {
		
		_stage.removeEventListener(KeyboardEvent.KEY_DOWN, _onKeyDown);
		_stage.removeEventListener(KeyboardEvent.KEY_UP, _onKeyUp);
		
	}
	
	// getters / setters
	
	public function left():Bool {
		return _left;
	}
	
	public function right():Bool {
		return _right;
	}
	
}