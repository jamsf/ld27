package net.ld27.worlds 
{
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	
	import net.ld27.entities.ui.ScrollingText;
	import net.ld27.entities.ui.Fade;
	import net.ld27.MusicController;
	
	/**
	 * ...
	 * @author Jams
	 */
	public class PreGame extends World 
	{
		private var text 	: ScrollingText;
		private var fade	: Fade;
		private var started : Boolean;
		
		public function PreGame() 
		{
			fade = new Fade();
			text = new ScrollingText(new Array( "Loading...",
												"Get Ready...",
												"Click to Continue."
												));
			add(text);
			text.startTextRead();
			started = false;
		}
		
		override public function update():void 
		{
			super.update();
			
			if (Input.mousePressed && !started)
			{
				MusicController.Instance.muslimgauze.loop();
				add(fade);
				started = true;
			}
		}
	}
}