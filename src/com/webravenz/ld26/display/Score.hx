package com.webravenz.ld26.display;
import com.webravenz.ld26.game.Game;
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
		_txtScore.text = '1200';
		addChild(_txtScore);
		
		_txtBonus1 = new TextField();
		_txtBonus1.defaultTextFormat = _format1;
		_txtBonus1.selectable = false;
		_txtBonus1.embedFonts = true;
		_txtBonus1.width = 120;
		_txtBonus1.x = 230;
		_txtBonus1.y = 237;
		_txtBonus1.text = '41';
		addChild(_txtBonus1);
		
		_txtBonus2 = new TextField();
		_txtBonus2.defaultTextFormat = _format2;
		_txtBonus2.selectable = false;
		_txtBonus2.embedFonts = true;
		_txtBonus2.width = 120;
		_txtBonus2.x = 0;
		_txtBonus2.y = 237;
		_txtBonus2.text = '32';
		addChild(_txtBonus2);
		
		
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