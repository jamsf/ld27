package net.ld27.worlds 
{
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.ld27.entities.bombs.BombBase;
	
	import net.ld27.entities.bombs.C4Base;
	
	/**
	 * ...
	 * @author Jams
	 */
	public class WiredBomb extends World 
	{
		private var _bomb : BombBase;
		
		public function WiredBomb() 
		{
			
		}
		
		override public function begin():void 
		{
			super.begin();
			
			// Put bomb in lower half center of screen
			_bomb = new C4Base(FP.screen.width * 0.5, FP.screen.height * 0.75);
		}
	}
}