package com.webravenz.ld26.display;
import nme.events.KeyboardEvent;
import nme.ui.Keyboard;
import nme.Assets;
import nme.display.Bitmap;

/**
 * ...
 * @author Webravenz
 */

class Tuto2 extends Page
{
	
	private var _image:Bitmap;

	public function new() 
	{
		super();
	}
	
	private override function _onAddedToStage():Void {
		
		_image = new Bitmap(Assets.getBitmapData('assets/img/gameplay.png'));
		addChild(_image);
		
		super._onAddedToStage();
	}
	
	private override function _init():Void {
		stage.addEventListener(KeyboardEvent.KEY_DOWN, _onKeyDown);
	}
	
	private function _onKeyDown(e:KeyboardEvent):Void {
		if (e.keyCode == Keyboard.SPACE) {
			_hide();
		}
	}
	
	private override function _hideComplete():Void {
		removeChild(_image);
		_image = null;
		
		targetPage = 'game.Game';
		
		stage.removeEventListener(KeyboardEvent.KEY_DOWN, _onKeyDown);
		
		super._hideComplete();
	}
	
}