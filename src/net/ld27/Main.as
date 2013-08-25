package net.ld27
{
	import flash.display.Sprite;
	import flash.events.Event;
	import net.ld27.worlds.Title;
	import net.ld27.worlds.WiredBomb;
	
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	import net.ld27.worlds.PreGame;
	
	/**
	 * ...
	 * @author jams
	 */
	public class Main extends Engine 
	{
		public function Main():void 
		{
			super(800, 600, 60, false);
			
			// Create initial world
			//FP.world = new WiredBomb("e");
			FP.world = new PreGame();
		}
		
		override public function init():void
		{
			trace("THIS IS WORKING PROPERLY");
		}
		
		override public function update():void 
		{
			super.update();
			
			if (Input.check(Key.DELETE))
				FP.console.enable();
			//Input.mouseCursor = "hide";
		}
	}
	
}