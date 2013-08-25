package net.ld27.worlds 
{
	import net.flashpunk.World;
	import net.ld27.entities.ui.DeathText;
	
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Death extends World 
	{
		
		public function Death() 
		{
			FP.screen.color = 0xFFFFFF;
			add(new DeathText());
		}
	}
}