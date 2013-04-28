package com.webravenz.ld26.game;
import com.webravenz.ld26.display.ASprite;
import com.webravenz.ld26.display.EntitiesLayer;
import com.webravenz.ld26.display.Page;
import com.webravenz.ld26.display.Home;
import com.webravenz.ld26.display.Score;
import com.webravenz.ld26.game.data.Sequences;
import com.webravenz.ld26.game.entities.Bonus;
import com.webravenz.ld26.game.entities.Player;
import com.webravenz.ld26.game.entities.Rect;
import nme.Assets;
import nme.events.Event;
import nme.events.KeyboardEvent;
import nme.media.Sound;
import nme.text.TextField;
import nme.text.TextFormat;
import nme.text.TextFormatAlign;
import nme.ui.Keyboard;

/**
 * ...
 * @author Webravenz
 */

class Game extends Page
{

	public static var COLOR1:Int = 0xED1A64;
	public static var COLOR2:Int = 0xBDD631;
	public static var WIDTH:Int = 350;
	
	public static var speed:Float = 1;
	public static var controls:Controls;
	
	private var _player:Player;
	private var _layer:EntitiesLayer;
	
	private var _barTimer:Float = 50;
	private var _noBonusTimer:Float = 0;
	
	private var _scoreTxt:TextField;
	private var _scoreFormat:TextFormat;
	private var _score:Int;

	public function new() 
	{
		
		super();
		
	}
	
	private override function _onAddedToStage():Void {
		
		_layer = new EntitiesLayer();
		addChild(_layer);
		
		controls = new Controls(stage);
		controls.start();
		
		_player = new Player(this);
		_layer.addEntity(_player);
		
		speed = 1;
		_barTimer = 50;
		_noBonusTimer = 0;
		
		_score = Score.bar1 = Score.bar2 = Score.bonus1 = Score.bonus2 = Score.score = 0;
		
		var font = Assets.getFont ("assets/font/Roboto-Condensed.ttf");
		_scoreFormat = new TextFormat (font.fontName, 24, 0xFFFFFF);
		_scoreFormat.align = TextFormatAlign.RIGHT;
		_scoreTxt = new TextField();
		_scoreTxt.defaultTextFormat = _scoreFormat;
		_scoreTxt.selectable = false;
		_scoreTxt.embedFonts = true;
		_scoreTxt.width = 340;
		_scoreTxt.x = 0;
		_scoreTxt.y = 10;
		_scoreTxt.text = ''+_score;
		addChild(_scoreTxt);
		
		var sound:Sound = new Sound();
		
		super._onAddedToStage();
		
		
	}
	
	private override function _init():Void {
		
		addEventListener(Event.ENTER_FRAME, _update);
		
	}
	
	// update all entites each frame
	private function _update(e:Event):Void 
	{
		_layer.update();
		
		_barTimer -= speed;
		if (_barTimer < 0) _createBar();
		
		_noBonusTimer -= speed;
		_createBonus();
		
		speed += 0.001;
		
		if (_player.lose) _over();
	}
	
	public function addScore(add:Int):Void {
		_score += add;
		_scoreTxt.text = ''+_score;
	}
	
	private override function _onRemovedFromStage():Void {
		
		
	}
	
	private function _over() {
		Score.score = _score;
		removeEventListener(Event.ENTER_FRAME, _update);
		controls.stop();
		targetPage = 'display.Score';
		_hide();
		
	}
	
	private override function _hideComplete():Void {
		_layer.clear();
		super._hideComplete();
	}
	
	private function _createBar() {
		_barTimer = 160;
		_noBonusTimer = 60;
		
		var s:Int = Math.round(WIDTH * Math.random());
		
		var color1:Int = Math.random() > 0.5 ? 1 : 2;
		var color2:Int = color1 == 1 ? 2 : 1;
		
		var rect1 = new Rect();
		rect1.init(color1, 0, -50, s, 8);
		_layer.addEntity(rect1);
		
		var rect2 = new Rect();
		rect2.init(color2, s, -50, WIDTH - s, 8);
		_layer.addEntity(rect2);
	}
	
	// create bonus randomly
	private function _createBonus():Void {
		var chanceBonus:Float = speed / 320;
		if (Math.random() <= chanceBonus && _noBonusTimer <= 0) {
			var bonus = new Bonus();
			bonus.init();
			_layer.addEntity(bonus);
		}
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