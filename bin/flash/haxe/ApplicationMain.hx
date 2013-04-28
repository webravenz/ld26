#if nme

import com.webravenz.ld26.Main;
import nme.Assets;
import nme.events.Event;


class ApplicationMain {
	
	static var mPreloader:NMEPreloader;

	public static function main () {
		
		var call_real = true;
		
		
		var loaded:Int = nme.Lib.current.loaderInfo.bytesLoaded;
		var total:Int = nme.Lib.current.loaderInfo.bytesTotal;
		
		nme.Lib.current.stage.align = nme.display.StageAlign.TOP_LEFT;
		nme.Lib.current.stage.scaleMode = nme.display.StageScaleMode.NO_SCALE;
		
		if (loaded < total || true) /* Always wait for event */ {
			
			call_real = false;
			mPreloader = new NMEPreloader();
			nme.Lib.current.addChild(mPreloader);
			mPreloader.onInit();
			mPreloader.onUpdate(loaded,total);
			nme.Lib.current.addEventListener (nme.events.Event.ENTER_FRAME, onEnter);
			
		}
		
		
		#if !fdb
		haxe.Log.trace = flashTrace;
		#end
		
		if (call_real)
			begin ();
	}

	#if !fdb
	private static function flashTrace( v : Dynamic, ?pos : haxe.PosInfos ) {
		var className = pos.className.substr(pos.className.lastIndexOf('.') + 1);
		var message = className+"::"+pos.methodName+":"+pos.lineNumber+": " + v;
		
        if (flash.external.ExternalInterface.available)
			flash.external.ExternalInterface.call("console.log", message);
		else untyped flash.Boot.__trace(v, pos);
    }
	#end
	
	private static function begin () {
		
		var hasMain = false;
		
		for (methodName in Type.getClassFields(com.webravenz.ld26.Main))
		{
			if (methodName == "main")
			{
				hasMain = true;
				break;
			}
		}
		
		if (hasMain)
		{
			Reflect.callMethod (com.webravenz.ld26.Main, Reflect.field (com.webravenz.ld26.Main, "main"), []);
		}
		else
		{
			var instance = Type.createInstance(com.webravenz.ld26.Main, []);
			if (Std.is (instance, nme.display.DisplayObject)) {
				nme.Lib.current.addChild(cast instance);
			}	
		}
		
	}

	static function onEnter (_) {
		
		var loaded = nme.Lib.current.loaderInfo.bytesLoaded;
		var total = nme.Lib.current.loaderInfo.bytesTotal;
		mPreloader.onUpdate(loaded,total);
		
		if (loaded >= total) {
			
			nme.Lib.current.removeEventListener(nme.events.Event.ENTER_FRAME, onEnter);
			mPreloader.addEventListener (Event.COMPLETE, preloader_onComplete);
			mPreloader.onLoaded();
			
		}
		
	}

	public static function getAsset (inName:String):Dynamic {
		
		
		if (inName=="assets/font/Roboto-Condensed.ttf")
			 
			 return Assets.getFont ("assets/font/Roboto-Condensed.ttf");
		 
		
		if (inName=="assets/sound/hard_kick.wav")
			 
            return Assets.getSound ("assets/sound/hard_kick.wav");
         
		
		if (inName=="assets/sound/hh_frappe1.wav")
			 
            return Assets.getSound ("assets/sound/hh_frappe1.wav");
         
		
		if (inName=="assets/sound/hh_frappe2.wav")
			 
            return Assets.getSound ("assets/sound/hh_frappe2.wav");
         
		
		if (inName=="assets/sound/snare_stick.wav")
			 
            return Assets.getSound ("assets/sound/snare_stick.wav");
         
		
		if (inName=="assets/img/controls.png")
			 
            return Assets.getBitmapData ("assets/img/controls.png");
         
		
		if (inName=="assets/img/gameplay.png")
			 
            return Assets.getBitmapData ("assets/img/gameplay.png");
         
		
		if (inName=="assets/img/home.png")
			 
            return Assets.getBitmapData ("assets/img/home.png");
         
		
		if (inName=="assets/img/score.png")
			 
            return Assets.getBitmapData ("assets/img/score.png");
         
		
		
		return null;
		
	}
	
	
	private static function preloader_onComplete (event:Event):Void {
		
		mPreloader.removeEventListener (Event.COMPLETE, preloader_onComplete);
		
		nme.Lib.current.removeChild(mPreloader);
		mPreloader = null;
		
		begin ();
		
	}
	
}

class NME_assets_font_roboto_condensed_ttf extends nme.text.Font { }
class NME_assets_sound_hard_kick_wav extends nme.media.Sound { }
class NME_assets_sound_hh_frappe1_wav extends nme.media.Sound { }
class NME_assets_sound_hh_frappe2_wav extends nme.media.Sound { }
class NME_assets_sound_snare_stick_wav extends nme.media.Sound { }
class NME_assets_img_controls_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_img_gameplay_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_img_home_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_img_score_png extends nme.display.BitmapData { public function new () { super (0, 0); } }


#else

import com.webravenz.ld26.Main;

class ApplicationMain {
	
	public static function main () {
		
		var hasMain = false;
		
		for (methodName in Type.getClassFields(com.webravenz.ld26.Main))
		{
			if (methodName == "main")
			{
				hasMain = true;
				break;
			}
		}
		
		if (hasMain)
		{
			Reflect.callMethod (com.webravenz.ld26.Main, Reflect.field (com.webravenz.ld26.Main, "main"), []);
		}
		else
		{
			var instance = Type.createInstance(com.webravenz.ld26.Main, []);
			if (Std.is (instance, flash.display.DisplayObject)) {
				flash.Lib.current.addChild(cast instance);
			}
		}
		
	}

}

#end
