package com.webravenz.ld26;

import com.webravenz.ld26.display.Page;
import nme.display.Sprite;
import nme.events.Event;
import nme.Lib;
import com.webravenz.ld26.game.Game;

/**
 * ...
 * @author Webravenz
 */

class Main extends Sprite 
{
	
	private var _currentPage:Page;
	
	public function new() 
	{
		super();
		#if iphone
		Lib.current.stage.addEventListener(Event.RESIZE, init);
		#else
		addEventListener(Event.ADDED_TO_STAGE, init);
		#end
	}

	private function init(e) 
	{
		_showPage('display.Home');
	}
	
	private function _showPage(pageName:String) {
		if (_currentPage != null) {
			removeChild(_currentPage);
			_currentPage = null;
		}
		
		_currentPage = Type.createInstance( Type.resolveClass( 'com.webravenz.ld26.' + pageName ), [] ); 
		_currentPage.addEventListener(Page.COMPLETE, _changePage);
		addChild(_currentPage);
	}
	
	private function _changePage(e:Event):Void {
		_currentPage.removeEventListener(Page.COMPLETE, _changePage);
		_showPage(_currentPage.targetPage);
	}
	
	static public function main() 
	{
		var stage = Lib.current.stage;
		stage.scaleMode = nme.display.StageScaleMode.NO_SCALE;
		stage.align = nme.display.StageAlign.TOP_LEFT;
		
		Lib.current.addChild(new Main());
	}
	
}
