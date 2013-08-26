package net.ld27.entities.bombs 
{
	import adobe.utils.ProductManager;
	import net.flashpunk.FP;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.ld27.entities.ui.Fade;
	import net.ld27.worlds.Death;
	
	/**
	 * ...
	 * @author ...
	 */
	
	public class BombBase extends Entity 
	{
		protected var _timerX : int;
		protected var _timerY : int;
		
		protected var _timer : BombTimer;
		
		public var _wires : Array;
		public var _wireOrderCut	: Array;
		public var _wiresCut : int;
		
		public var detonated : Boolean;
		public var defused : Boolean;
		
		public function BombBase(img:Image,x:int, y:int, order:Array) 
		{
			this.x = x;
			this.y = y;
			
			detonated = false;
			defused = false;
			
			graphic = img;
			width = (graphic as Image).width;
			height = (graphic as Image).height;
			
			_timerX = x + 20;
			_timerY = y - 20;
			
			_wireOrderCut = order;
			
			init();
		}
		
		protected function init() : void
		{
			//_wireOrerCut = GET PUZZLE ORDER
			_wiresCut = 0;
			
			// Add Self
			FP.world.add(this);
			
			// Add Timer
			_timer = new BombTimer(10, _timerX, _timerY, this);
			FP.world.add(_timer);
			
			// Initialize wires
			_wires = new Array();
		}
		
		public function addWire(wire:Wire):void
		{
			_wires.push(wire);
			FP.world.add(wire);
		}
		
		override public function update():void 
		{
			super.update();
			
			// Check if player trying to cut wire
			if (Input.mousePressed && !detonated && !defused)
			{
				var mouseX : int = Input.mouseX;
				var mouseY : int = Input.mouseY;
				
				for each(var w : Wire in _wires)
				{
					if (mouseX >= w.x && mouseX <= w.x + w.width
						&& mouseY >= w.y && mouseY <= w.y + w.height)
					{
						cutWireOutcome(w);
					}
				}
			}
		}
		
		private function cutWireOutcome(wire: Wire):void
		{
			if (wire.wireCut)
				return;
				
			wire.cut();
						
			// Check if wire blows up bomb
			if (wire.getColor() != _wireOrderCut[_wiresCut])
			{
				trace("YA BLEW UP");
				detonated = true;
				return;
			}
			
			++_wiresCut;
			
			// Check if bomb now defused
			if (_wiresCut == _wireOrderCut.length)
			{
				trace("YA SAVED THE DAY!");
				defused = true;
				return;
			}
		}
		
		
	}
}