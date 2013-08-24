package net.ld27.entities.bombs 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author ...
	 */
	public class C4Base extends BombBase 
	{
		[Embed(source = '/../assets/sprites/c4_base.png')] private const C4BASE:Class;
		
		public function C4Base(x:int, y:int) 
		{
			super(x, y);
			
			init();
		}
		
		override protected function init():void 
		{
			graphic = new Image(C4BASE);
			width = (graphic as Image).width;
			height = (graphic as Image).height;
			
			// Move in proportion to the new image
			x = x - (width * 0.5);
			y = y - (height * 0.5);
			
			TimerX = x + (0.50 * width) + 20;
			TimerY = y + (0.25 * height) + 60;
			
			super.init();
		}
	}
}