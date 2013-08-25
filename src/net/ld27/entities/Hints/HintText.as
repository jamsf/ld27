package net.ld27.entities.Hints 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	
	/**
	 * ...
	 * @author ...
	 */
	public class HintText extends Entity 
	{
		public var hintText : Text;
		
		public function HintText(text:String, xPos:int, yPos:int, size:int) 
		{
			hintText = new Text(text, xPos, yPos, { 
				"size":size, "width":408, "height":216, "wordWrap":true} );
			hintText.color = 0x000000;
			hintText.wordWrap = true;
			hintText.resizable = false;
			
			graphic = hintText;
		}
	}
}