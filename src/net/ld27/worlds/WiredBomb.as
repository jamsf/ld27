package net.ld27.worlds 
{
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.ld27.entities.bombs.BombBase;
	
	import net.ld27.entities.bombs.BombFactory;
	import net.ld27.entities.bombs.BombBase;
	
	/**
	 * ...
	 * @author Jams
	 */
	public class WiredBomb extends World 
	{
		private var _bomb : BombBase;
		private var _bombStr : String;
		
		public function WiredBomb(bomb:String) 
		{
			_bombStr = bomb;
		}
		
		override public function begin():void 
		{
			super.begin();
			
			// Put bomb in lower half center of screen
			
			if (_bombStr == "e")
			{
				_bomb = BombFactory.Instance.buildEasyBomb(FP.screen.width * 0.5, FP.screen.height * 0.75, 
														FP.screen.width * 0.5, FP.screen.height * 0.25);
			}
			else if (_bombStr == "m")
			{
				_bomb = BombFactory.Instance.buildMediumBomb(FP.screen.width * 0.5, FP.screen.height * 0.75, 
														FP.screen.width * 0.5, FP.screen.height * 0.25);
			}
			else if (_bombStr == "h")
			{
				_bomb = BombFactory.Instance.buildHardBomb(FP.screen.width * 0.5, FP.screen.height * 0.75, 
														FP.screen.width * 0.5, FP.screen.height * 0.25);
			}
		}
	}
}