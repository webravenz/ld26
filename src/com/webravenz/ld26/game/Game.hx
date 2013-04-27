package com.webravenz.ld26.game;
import com.webravenz.ld26.display.ASprite;
import com.webravenz.ld26.display.EntitiesLayer;
import com.webravenz.ld26.game.entities.Player;
import nme.events.Event;

/**
 * ...
 * @author Webravenz
 */

class Game extends ASprite
{

	public static var COLOR1:Int = 0xffa800;
	public static var COLOR2:Int = 0x00a8ff;
	
	public static var controls:Controls;
	
	private var _player:Player;
	private var _layer:EntitiesLayer;

	public function new() 
	{
		
		super();
		
	}
	
	private override function _onAddedToStage():Void {
		
		_layer = new EntitiesLayer();
		addChild(_layer);
		
		controls = new Controls(stage);
		controls.start();
		
		_player = new Player();
		_layer.addEntity(_player);
		
		addEventListener(Event.ENTER_FRAME, _update);
		
	}
	
	// update all entites each frame
	private function _update(e:Event):Void 
	{
		_layer.update();
	}
	
	private override function _onRemovedFromStage():Void {
		
		controls.stop();
		
	}
	
}