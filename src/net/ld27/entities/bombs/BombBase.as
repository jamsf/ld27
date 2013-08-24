package net.ld27.entities.bombs 
{
	import net.flashpunk.FP;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author ...
	 */
	
	public class BombBase extends Entity 
	{
		protected var TimerX : int;
		protected var TimerY : int;
		
		protected var _timer : BombTimer;
		
		public function BombBase(x:int, y:int) 
		{
			this.x = x;
			this.y = y;
		}
		
		protected function init() : void
		{
			// Add Self
			FP.world.add(this);
			
			// Add Timer
			trace("TIMERX: " + TimerX);
			_timer = new BombTimer(80, TimerX, TimerY);
			FP.world.add(_timer);
		}
	}
}