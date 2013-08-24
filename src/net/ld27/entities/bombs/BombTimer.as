package net.ld27.entities.bombs 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Data;
	
	/**
	 * ...
	 * @author ...
	 */
	public class BombTimer extends Entity 
	{
		private var _text: Text;
		private var _bombTime: int;
		
		private var _started: Boolean;
		private var _startTime: Number;
		private var _targetTime: Number;
		
		public function BombTimer(bombTime : int, x:int, y:int) 
		{
			_bombTime = bombTime;
			
			_text = new Text("00:00:000", x, y);
			graphic = _text;
			_text.size = 36;
			_started = false;
		}
		
		private function start() : void
		{
			var today:Date = new Date();
			_startTime = today.getTime();
			var targetDate:Date = new Date(today.getFullYear(), today.getMonth(), today.getDate(), today.getHours(), today.getMinutes(),
													today.getSeconds() + _bombTime, today.getMilliseconds());
			_targetTime = targetDate.getTime();
			
			_started = true;
		}
		
		override public function update():void 
		{
			super.update();
			if (!_started)
			{
				_text.text = "00:00:0000";
				return;
			}
			
			// Get current time
			var today:Date = new Date();
			var currentTime:Number = today.getTime();
			var timeLeft : Number = _targetTime - currentTime;
			
			var sec : int = Math.floor(timeLeft / 1000) as int;
			var min : int = Math.floor(sec / 60) as int;
			
			// Update time strings
			var secStr:String = String(sec % 60);
			if (secStr.length < 2)
			{
				secStr = "0" + secStr;
			}
			var minStr:String = String(min % 60);
			if (minStr.length < 2)
			{
				minStr = "0" + minStr;
			}
			var milliStr:String = String(timeLeft % 1000);
			switch(milliStr.length)
			{
				case 2:
					milliStr = "0" + milliStr;
					break;
				case 1:
					milliStr = "00" + milliStr;
					break;
				default:
					break;
			}
			
			// Display time
			if (timeLeft > 0 )
			{
				var counter:String = minStr + ":" + secStr + ":" + milliStr;
				_text.text = counter;
			}
			else
			{
				//trace("TIME'S UP");
				var newTime:String = "00:00:0000";
				_text.text = newTime;
			}
		}
		
		override public function added():void 
		{
			super.added();
			
			start();
		}
	}
}