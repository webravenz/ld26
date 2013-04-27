package com.webravenz.ld26.game.data;
import com.webravenz.ld26.utils.AMath;

/**
 * ...
 * @author Webravenz
 */

typedef Sequence = {
    var entities:Array<SequenceObject>;
    var height:Int;
}

typedef SequenceObject = {
	var type:String;
	var color:Int;
	var posX:Int;
	var posY:Int;
	var width:Int;
	var height:Int;
}

class Sequences
{
	public var max:Int = 3;
	
	public function new() 
	{
		
	}
	
	public function get():Sequence {
		return _get(Math.round(AMath.random(0, max)));
	}
	
	private function _get(num):Sequence {
		
		var sequence:Sequence = {
			entities: [],
			height: 0
		};
		
		switch(num) {
			// 3 lignes horizontales
			case 0 :
				sequence.height = 200;
				sequence.entities = [
					{
						type: 'rect',
						color: 1,
						posX: 0,
						posY: 0,
						width: 350,
						height: 5
					},
					{
						type: 'rect',
						color: 2,
						posX: 0,
						posY: 75,
						width: 350,
						height: 5
					},
					{
						type: 'rect',
						color: 1,
						posX: 0,
						posY: 150,
						width: 350,
						height: 5
					}
				];
			// 4 carrés
			case 1 :
				sequence.height = 250;
				sequence.entities = [
					{
						type: 'rect',
						color: 1,
						posX: 0,
						posY: 0,
						width: 150,
						height: 150
					},
					{
						type: 'rect',
						color: 2,
						posX: 150,
						posY: 150,
						width: 100,
						height: 100
					},
					{
						type: 'rect',
						color: 1,
						posX: 250,
						posY: 90,
						width: 60,
						height: 60
					},
					{
						type: 'rect',
						color: 2,
						posX: 310,
						posY: 150,
						width: 40,
						height: 40
					}
				];
			// chemin vers la gauche
			case 2 :
				sequence.height = 250;
				sequence.entities = [
					{
						type: 'rect',
						color: 1,
						posX: 100,
						posY: 0,
						width: 250,
						height: 20
					},
					{
						type: 'rect',
						color: 1,
						posX: 0,
						posY: 230,
						width: 250,
						height: 20
					},
					{
						type: 'rect',
						color: 2,
						posX: 0,
						posY: 30,
						width: 350,
						height: 190
					}
				];
		}
		
		return sequence;
	}
	
}