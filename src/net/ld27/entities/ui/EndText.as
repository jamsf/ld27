package net.ld27.entities.ui
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.FP;
	
	import net.ld27.MusicController;
	
	/**
	 * ...
	 * @author Jams
	 */
	public class EndText extends Entity 
	{
		
		private var _titleTimer 	:uint;
		private var _showingTitle	:Boolean;
		private var _credits		:Text;
		
		public function EndText() 
		{
			_titleTimer = 60 * 4;
			_showingTitle = false;
			
			_credits = new Text("null", 400, 450);
			_credits.text = "Game by James Farmer\n\n\tMusic from MuslimGauze"
			MusicController.Instance.muslimgauze.stop();
			
			graphic = _credits;
			(graphic as Image).alpha = 0;
			
			FP.camera.x = 0;
			FP.camera.y = 0;
		}
		
		override public function update():void 
		{
			super.update();
			
			if (_titleTimer > 0)
			{
				--_titleTimer;
			}
			else
			{
				if (!_showingTitle)
				{
					(graphic as Image).alpha = 1;
					_showingTitle = true;
				}
			}
		}
	}

}