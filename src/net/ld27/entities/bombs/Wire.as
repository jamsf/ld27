package net.ld27.entities.bombs 
{
	import net.flashpunk.FP;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Wire extends Entity 
	{
		[Embed(source = '/../assets/sprites/wire0.png')] private const WIRE0:Class;
		[Embed(source = '/../assets/sprites/wire1.png')] private const WIRE1:Class;
		[Embed(source = '/../assets/sprites/wire2.png')] private const WIRE2:Class;
		[Embed(source = '/../assets/sprites/wire3.png')] private const WIRE3:Class;
		[Embed(source = '/../assets/sprites/wire4.png')] private const WIRE4:Class;
		[Embed(source = '/../assets/sprites/wire5.png')] private const WIRE5:Class;
		
		public var wireCut : Boolean;
		public var wireNumber : int;
		
		public function Wire(xPos:int, yPos:int, color:uint) 
		{
			var map : Spritemap = new Spritemap(getRandomWire(), 144, 36);
			map.add("uncut", [0]);
			map.add("cut", [1]);
			map.play("uncut");
			wireCut = false;
			map.color = color;
			
			graphic = map;
			width = 144
			height = 36;
			
			x = xPos;
			y = yPos;
		}
		
		public function cut() : void
		{
			(graphic as Spritemap).play("cut");
			wireCut = true;
		}
		
		public function getColor() : uint
		{
			return (graphic as Spritemap).color;
		}
		
		private function getRandomWire() : Class
		{
			switch(FP.rand(6))
			{
				case 0:
					return WIRE0;
				case 1:
					return WIRE1;
				case 2:
					return WIRE2;
				case 3:
					return WIRE3;
				case 4:
					return WIRE4;
				case 5:
					return WIRE5;
				default:
					return WIRE0;
			}
		}
	}
}