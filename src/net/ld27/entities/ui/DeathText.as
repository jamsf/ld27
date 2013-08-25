package net.ld27.entities.ui 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	
	import net.ld27.MusicController;
	
	/**
	 * ...
	 * @author ...
	 */
	public class DeathText extends Entity 
	{
		private var _deathMessage		:Text;
		private var _ringingTimer		:int;
		
		public function DeathText() 
		{
			MusicController.Instance.muslimgauze.stop();
			MusicController.Instance.explosion.play();
			_ringingTimer = 60;
		}
		
		override public function update():void 
		{
			super.update();
			
			if (_ringingTimer > -1)
				--_ringingTimer;
				
			if (_ringingTimer == 0)
			{
				MusicController.Instance.ringing.play();
			}
		}
	}
}