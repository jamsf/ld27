package net.ld27 
{
	import net.flashpunk.Sfx;
	/**
	 * ...
	 * @author Jams
	 */
	public class MusicController 
	{
		[Embed(source = '/../assets/sounds/explosion.mp3')] private const EXPLOSION:Class;
		[Embed(source = '/../assets/sounds/ringing.mp3')] private const RINGING:Class;
		[Embed(source = '/../assets/sounds/muslimgauze.mp3')] private const MUSLIM:Class;
		
		private static var _instance : MusicController;
		
		public static function get Instance() : MusicController
		{
			if (_instance == null)
				_instance = new MusicController(new SingletonEnforcer());
			return _instance;
		}
		
		public var explosion : Sfx;
		public var ringing	: Sfx;
		public var muslimgauze : Sfx;
		
		public function MusicController(e:SingletonEnforcer) 
		{
			explosion = new Sfx(EXPLOSION);
			ringing = new Sfx(RINGING);
			muslimgauze = new Sfx(MUSLIM);
		}
	}
}

class SingletonEnforcer
{
	
}