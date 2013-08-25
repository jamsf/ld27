package net.ld27.entities.ui
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author Jams
	 */
	public class TitleText extends Entity 
	{
		[Embed(source = '/../assets/sprites/title.png')] private const TITLE:Class;
		
		public function TitleText(x:uint, y:uint) 
		{
			this.x = x;
			this.y = y;
			
			graphic = new Image(TITLE);
		}
		
		public function setAlpha(a:Number):void
		{
			(graphic as Image).alpha = a;
		}
	}
}