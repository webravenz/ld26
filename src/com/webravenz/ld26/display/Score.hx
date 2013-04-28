package com.webravenz.ld26.display;
import com.webravenz.ld26.game.Game;
import nme.display.Sprite;
import nme.text.Font;
import nme.events.KeyboardEvent;
import nme.text.TextField;
import nme.text.TextFormat;
import nme.text.TextFormatAlign;
import nme.ui.Keyboard;
import nme.Assets;
import nme.display.Bitmap;

/**
 * ...
 * @author Webravenz
 */

class Score extends Page
{
	
	private var _bkg:Bitmap;
	
	private var _font:Font;
	private var _format1:TextFormat;
	private var _format2:TextFormat;
	private var _formatScore:TextFormat;
	
	private var _txtScore:TextField;
	private var _txtBonus1:TextField;
	private var _txtBonus2:TextField;
	private var _txtBar1:TextField;
	private var _txtBar2:TextField;
	
	private var _barGraph:Sprite;
	
	public static var score:Int = 0;
	public static var bonus1:Int = 0;
	public static var bonus2:Int = 0;
	public static var bar1:Int = 0;
	public static var bar2:Int = 0;

	public function new() 
	{
		super();
	}
	
	private override function _onAddedToStage():Void {
		
		_bkg = new Bitmap(Assets.getBitmapData('assets/img/score.png'));
		addChild(_bkg);
		
		_font = Assets.getFont('assets/font/Roboto-Condensed.ttf');
		
		_formatScore = new TextFormat(_font.fontName, 24, 0xFFFFFF);
		_formatScore.align = TextFormatAlign.CENTER;
		
		_format1 = new TextFormat(_font.fontName, 18, Game.COLOR1);
		_format1.align = TextFormatAlign.LEFT;
		
		_format2 = new TextFormat(_font.fontName, 18, Game.COLOR2);
		_format2.align = TextFormatAlign.RIGHT;
		
		_txtScore = new TextField();
		_txtScore.defaultTextFormat = _formatScore;
		_txtScore.selectable = false;
		_txtScore.embedFonts = true;
		_txtScore.width = 350;
		_txtScore.x = 0;
		_txtScore.y = 160;
		_txtScore.text = ''+score;
		addChild(_txtScore);
		
		_txtBonus1 = new TextField();
		_txtBonus1.defaultTextFormat = _format1;
		_txtBonus1.selectable = false;
		_txtBonus1.embedFonts = true;
		_txtBonus1.width = 90;
		_txtBonus1.x = 260;
		_txtBonus1.y = 237;
		_txtBonus1.text = ''+bonus1;
		addChild(_txtBonus1);
		
		_txtBonus2 = new TextField();
		_txtBonus2.defaultTextFormat = _format2;
		_txtBonus2.selectable = false;
		_txtBonus2.embedFonts = true;
		_txtBonus2.width = 90;
		_txtBonus2.x = 0;
		_txtBonus2.y = 237;
		_txtBonus2.text = ''+bonus2;
		addChild(_txtBonus2);
		
		_txtBar1 = new TextField();
		_txtBar1.defaultTextFormat = _format1;
		_txtBar1.selectable = false;
		_txtBar1.embedFonts = true;
		_txtBar1.width = 90;
		_txtBar1.x = 260;
		_txtBar1.y = 280;
		_txtBar1.text = ''+bar1;
		addChild(_txtBar1);
		
		_txtBar2 = new TextField();
		_txtBar2.defaultTextFormat = _format2;
		_txtBar2.selectable = false;
		_txtBar2.embedFonts = true;
		_txtBar2.width = 90;
		_txtBar2.x = 0;
		_txtBar2.y = 280;
		_txtBar2.text = ''+bar2;
		addChild(_txtBar2);
		
		// draw bars
		var percent1:Float = 0.5;
		var percent2:Float = 0.5;
		var total:Int = bar1 + bar2;
		
		if (total > 0) {
			percent1 = bar1 / total;
			percent2 = bar2 / total;
		}
		
		_barGraph = new Sprite();
		_barGraph.x = 100;
		_barGraph.y = 289;
		
		_barGraph.graphics.beginFill(Game.COLOR1);
		_barGraph.graphics.drawRect(percent2 * 150, 0, percent1 * 150, 6);
		_barGraph.graphics.endFill();
		
		_barGraph.graphics.beginFill(Game.COLOR2);
		_barGraph.graphics.drawRect(0, 0, percent2 * 150, 6);
		_barGraph.graphics.endFill();
		
		addChild(_barGraph);
		
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
		removeChild(_bkg);
		_bkg = null;
		
		targetPage = 'game.Game';
		
		stage.removeEventListener(KeyboardEvent.KEY_DOWN, _onKeyDown);
		
		super._hideComplete();
	}
	
}