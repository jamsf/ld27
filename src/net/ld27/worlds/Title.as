package net.ld27.worlds 
{
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Sfx;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	
	import net.ld27.entities.ui.TitleText;
	import net.ld27.MusicController;
	
	/**
	 * ...
	 * @author Jams
	 */
	public class Title extends World 
	{
		private var _titleTimer 	:uint;
		private var _showingTitle	:Boolean;
		private var _title			:TitleText;
		
		public function Title() 
		{
			_titleTimer = 60 * 3;
			_showingTitle = false;
			
			_title = new TitleText(0, 0);
			_title.setAlpha(0);
			add(_title);
			
			FP.screen.color = 0xFF000000;
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
					_title.setAlpha(1);
					_showingTitle = true;
					_titleTimer = 60 * 3;
				}
				else
				{
					FP.world = new WiredBomb("e");
				}
			}
		}
	}
}