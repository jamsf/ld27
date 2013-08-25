package net.ld27.entities.bombs 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	import net.ld27.entities.Hints.HintFactory;
	
	/**
	 * ...
	 * @author ...
	 */
	
	public class BombFactory extends Entity 
	{
		private static var _instance : BombFactory;
		
		public static function get Instance() : BombFactory
		{
			if (_instance == null)
				_instance = new BombFactory(new SingletonEnforcer());
			return _instance;
		}
		
		public function BombFactory(e:SingletonEnforcer) 
		{
			
		}
		
		// STUPID ASS HACKY SHIT WHY AM I DOING THIS
		public var BombsCreated : int = -1;
		
		// TWO-WIRE BOMB
		
		[Embed(source = '/../assets/sprites/c4_base.png')] public const C4BASE:Class;
		[Embed(source = '/../assets/sprites/c4_medium.png')] public const C4MED:Class;
		[Embed(source = '/../assets/sprites/c4_hard.png')] public const C4HARD:Class;
		
		protected static const EASY_WIRE0_X : int = 108;
		protected static const EASY_WIRE0_Y : int = 120;
		protected static const EASY_WIRE1_X : int = 108;
		protected static const EASY_WIRE1_Y : int = 168;
		
		protected static const MED_WIRE0_X : int = 108;
		protected static const MED_WIRE0_Y : int = 96;
		protected static const MED_WIRE1_X : int = 108;
		protected static const MED_WIRE1_Y : int = 144;
		protected static const MED_WIRE2_X : int = 108;
		protected static const MED_WIRE2_Y : int = 192;
		
		protected static const HARD_WIRE0_X : int = 108;
		protected static const HARD_WIRE0_Y : int = 72;
		protected static const HARD_WIRE1_X : int = 108;
		protected static const HARD_WIRE1_Y : int = 120;
		protected static const HARD_WIRE2_X : int = 108;
		protected static const HARD_WIRE2_Y : int = 168;
		protected static const HARD_WIRE3_X : int = 108;
		protected static const HARD_WIRE3_Y : int = 216;
		
		public function buildEasyBomb(bombX:int, bombY:int, hintX:int, hintY:int) : BombBase
		{
			// GET EASY HINT HERE
			// HERE IS TEST INFO
			//var wiresCutOrder : Array = new Array( 0xFF0000, 0x00FF00 );
			var wiresCutOrder : Array = HintFactory.Instance.buildEasyHint(hintX, hintY);
			if (wiresCutOrder == null)
			{
				trace("NULL WIRE ORDER");
				return null;
			}
			
			var bomb : BombBase = new BombBase(new Image(C4BASE), bombX, bombY, wiresCutOrder);
			
			// Move in proportion to the new image
			bomb.x = bomb.x - (bomb.width * 0.5);
			bomb.y = bomb.y - (bomb.height * 0.5);
			
			var shuffledColors : Array = randomlyShuffleWires(wiresCutOrder);
			
			// Add Wires
			bomb.addWire( new Wire(bomb.x + EASY_WIRE0_X, bomb.y + EASY_WIRE0_Y, shuffledColors[0] ));
			bomb.addWire( new Wire(bomb.x + EASY_WIRE1_X, bomb.y + EASY_WIRE1_Y, shuffledColors[1] ));
			
			return bomb;
		}
		
		public function buildMediumBomb(xPos:int, yPos:int, hintX:int, hintY:int) : BombBase
		{
			// GET EASY HINT HERE
			// HERE IS TEST INFO
			//var wiresCutOrder : Array = new Array( 0xFF0000, 0x00FF00 );
			var wiresCutOrder : Array = HintFactory.Instance.buildMediumHint(hintX, hintY);
			if (wiresCutOrder == null)
			{
				trace("NULL WIRE ORDER");
				return null;
			}
			
			var bomb : BombBase = new BombBase(new Image(C4MED), xPos, yPos, wiresCutOrder);
			
			// Move in proportion to the new image
			bomb.x = bomb.x - (bomb.width * 0.5);
			bomb.y = bomb.y - (bomb.height * 0.5);
			
			var shuffledColors : Array = randomlyShuffleWires(wiresCutOrder);
			
			// Add Wires
			bomb.addWire( new Wire(bomb.x + MED_WIRE0_X, bomb.y + MED_WIRE0_Y, shuffledColors[0] ));
			bomb.addWire( new Wire(bomb.x + MED_WIRE1_X, bomb.y + MED_WIRE1_Y, shuffledColors[1] ));
			bomb.addWire( new Wire(bomb.x + MED_WIRE2_X, bomb.y + MED_WIRE2_Y, shuffledColors[2] ));
			
			return bomb;
		}
		
		
		
		public function buildHardBomb(xPos:int, yPos:int, hintX:int, hintY:int ) : BombBase
		{
			// GET EASY HINT HERE
			// HERE IS TEST INFO
			//var wiresCutOrder : Array = new Array( 0xFF0000, 0x00FF00 );
			var wiresCutOrder : Array = HintFactory.Instance.buildHardHint(hintX, hintY);
			if (wiresCutOrder == null)
			{
				trace("NULL WIRE ORDER");
				return null;
			}
			
			var bomb : BombBase = new BombBase(new Image(C4HARD), xPos, yPos, wiresCutOrder);
			
			// Move in proportion to the new image
			bomb.x = bomb.x - (bomb.width * 0.5);
			bomb.y = bomb.y - (bomb.height * 0.5);
			
			var shuffledColors : Array = randomlyShuffleWires(wiresCutOrder);
			
			// Add Wires
			bomb.addWire( new Wire(bomb.x + HARD_WIRE0_X, bomb.y + HARD_WIRE0_Y, shuffledColors[0] ));
			bomb.addWire( new Wire(bomb.x + HARD_WIRE1_X, bomb.y + HARD_WIRE1_Y, shuffledColors[1] ));
			bomb.addWire( new Wire(bomb.x + HARD_WIRE2_X, bomb.y + HARD_WIRE2_Y, shuffledColors[2] ));
			bomb.addWire( new Wire(bomb.x + HARD_WIRE3_X, bomb.y + HARD_WIRE3_Y, shuffledColors[3] ));
			
			return bomb;
		}
		
		private function randomlyShuffleWires(wires:Array) : Array
		{
			// Randomly shuffle the wires
			var shuffledWires:Array = new Array();
			var randomPos:int = 0;
			for (var i:int = 0; i < wires.length; i++)
			{
				randomPos = int(Math.random() * wires.length);
				while (shuffledWires[randomPos] != null)      //repeat as long as the slot is not empty
				{
					randomPos = int(Math.random() * wires.length);    //pick a different slot
				}
				shuffledWires[randomPos] = wires[i];
			}
			
			return shuffledWires;
		}
	}
}

class SingletonEnforcer
{
	
}