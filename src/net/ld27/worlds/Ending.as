package net.ld27.worlds 
{
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Sfx;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	
	import net.ld27.entities.ui.EndText;
	import net.mnml.entities.ui.TitleText;
	
	/**
	 * ...
	 * @author Jams
	 */
	public class Ending extends World 
	{
		private var _titleTimer 	:int;
		private var _showingTitle	:Boolean;
		private var _credits		:EndText;
		
		public function Ending() 
		{
			FP.screen.color = 0x000000;
			add(new EndText());
		}
	}
}