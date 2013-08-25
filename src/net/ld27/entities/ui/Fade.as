package net.ld27.entities.ui 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.ld27.worlds.Title;
	
	import net.ld27.worlds.WiredBomb;
	import net.ld27.entities.bombs.BombFactory;
	
	/**
	 * ...
	 * @author Jams
	 */
	public class Fade extends Entity 
	{
		[Embed(source = '/../assets/sprites/black.png')] private const BLACK:Class;
		
		private var fading		:Boolean;
		private var fadeTimer	:uint;
		
		public function Fade() 
		{
			graphic = new Image(BLACK);
			(graphic as Image).alpha = 0;
			fadeTimer = 0;
		}
		
		override public function update():void 
		{
			super.update();
			
			x = FP.world.camera.x;
			y = FP.world.camera.y;
			
			++fadeTimer;
			(graphic as Image).alpha = fadeTimer / 120;
			
			// This is literally controlling what level we go to, how horrible
			if (fadeTimer == 140)
			{
				if (BombFactory.Instance.BombsCreated < 0)
				{
					FP.world = new Title();
				}
				else if (BombFactory.Instance.BombsCreated < 5)
				{
					FP.world = new WiredBomb("e");
				}
				else if (BombFactory.Instance.BombsCreated < 10)
				{
					FP.world = new WiredBomb("m");
				}
				else if (BombFactory.Instance.BombsCreated < 15)
				{
					FP.world = new WiredBomb("h");
				}
				
				++BombFactory.Instance.BombsCreated;
				trace("Bombs Created: " + BombFactory.Instance.BombsCreated);
			}
		}
	}
}