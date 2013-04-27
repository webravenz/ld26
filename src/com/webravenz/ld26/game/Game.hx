package com.webravenz.ld26.game;
import com.webravenz.ld26.display.ASprite;
import com.webravenz.ld26.display.EntitiesLayer;
import com.webravenz.ld26.game.data.Sequences;
import com.webravenz.ld26.game.entities.Player;
import com.webravenz.ld26.game.entities.Rect;
import nme.events.Event;

/**
 * ...
 * @author Webravenz
 */

class Game extends ASprite
{

	public static var COLOR1:Int = 0xffa800;
	public static var COLOR2:Int = 0x00a8ff;
	public static var WIDTH:Int = 350;
	
	public static var speed:Float = 1;
	public static var controls:Controls;
	
	private var _player:Player;
	private var _layer:EntitiesLayer;
	
	private var _barTimer:Float = 50;

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
		
		_barTimer -= speed;
		if (_barTimer < 0) _createBar();
		
		speed += 0.001;
		
		if (_player.lose) _over();
	}
	
	private override function _onRemovedFromStage():Void {
		
		
	}
	
	private function _over() {
		
		removeEventListener(Event.ENTER_FRAME, _update);
		controls.stop();
		
	}
	
	private function _createBar() {
		_barTimer = 200;
		
		var s:Int = Math.round(WIDTH * Math.random());
		
		var color1:Int = Math.random() > 0.5 ? 1 : 2;
		var color2:Int = color1 == 1 ? 2 : 1;
		
		var rect1 = new Rect();
		rect1.init(color1, 0, -20, s, 8);
		_layer.addEntity(rect1);
		
		var rect2 = new Rect();
		rect2.init(color2, s, -20, WIDTH - s, 8);
		_layer.addEntity(rect2);
	}
	
	/*
	private function _createSequence():Void {
		var sequence:Sequence = _sequences.get();
		
		_sequenceTimer = sequence.height + 150;
		
		var swap:Bool = Math.random() > 0.5 ? true : false;
		var sym:Bool = Math.random() > 0.5 ? true : false;
		
		for (obj in sequence.entities) {
			
			if (swap) obj.color = obj.color == 1 ? 2 : 1;
			if (sym) obj.posX = 350 - obj.width - obj.posX;
			
			switch(obj.type) {
				case 'rect' :
					var rect = new Rect();
					rect.init(obj.color, obj.posX, obj.posY - sequence.height, obj.width, obj.height);
					_layer.addEntity(rect);
			}
		}
	}*/
	
}