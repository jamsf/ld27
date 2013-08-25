package net.ld27.entities.Hints 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Hint extends Entity 
	{
		public var hintText : HintText;
		
		[Embed(source = '/../assets/sprites/hint_note.png')] public const HINT_NOTE:Class;
		public function Hint(text:String, xPos:int, yPos:int, size:int) 
		{
			this.x = xPos;
			this.y = yPos;
			
			graphic = new Image(HINT_NOTE);
			width = (graphic as Image).width;
			height = (graphic as Image).height;
			
			// Add self
			FP.world.add(this);
			
			// Add text
			hintText = new HintText(text, x - 200, y - 100, size);
			FP.world.add(hintText);
		}
	}
}