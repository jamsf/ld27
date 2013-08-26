package net.ld27.entities.Hints 
{
	import flash.sampler.NewObjectSample;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author ...
	 */
	public class HintFactory 
	{
		private static var _instance : HintFactory;
		
		public static function get Instance() : HintFactory
		{
			if (_instance == null)
				_instance = new HintFactory(new SingletonEnforcer());
			return _instance;
		}
		
		public function HintFactory(e:SingletonEnforcer) 
		{
			_unusedEasy = new Array(rg0, rg1, rg2, rg3, gr0, gr1, gr2, gr3);
			_unusedMedium = new Array(rgb, rbg, bgr, brg, grb, gbr);
			_unusedHard = new Array(rbgo, rgob, grbo, gobr, borg, bgro, orbg, ogbr);
		}
		
		private var _unusedEasy : Array;
		private var _unusedMedium : Array;
		private var _unusedHard : Array;
		
		public function buildEasyHint(xPos:int, yPos:int) : Array
		{
			var randIndex:uint = FP.rand(_unusedEasy.length);
			var hint: String = _unusedEasy.splice(randIndex, 1)[0];
			var hintObj : Hint = new Hint(hint, xPos, yPos, 28);
			
			// Move in proportion to the new image
			hintObj.x = hintObj.x - (hintObj.width * 0.5);
			hintObj.y = hintObj.y - (hintObj.height * 0.5);
			
			return getWireOrder(hint);
		}
		
		public function buildMediumHint(xPos:int, yPos:int) : Array
		{
			var randIndex:uint = FP.rand(_unusedMedium.length);
			var hint: String = _unusedMedium.splice(randIndex, 1)[0];
			var hintObj : Hint = new Hint(hint, xPos, yPos, 24);
			
			// Move in proportion to the new image
			hintObj.x = hintObj.x - (hintObj.width * 0.5);
			hintObj.y = hintObj.y - (hintObj.height * 0.5);
			
			return getWireOrder(hint);
		}
		
		public function buildHardHint(xPos:int, yPos:int) : Array
		{
			var randIndex:uint = FP.rand(_unusedHard.length);
			var hint: String = _unusedHard.splice(randIndex, 1)[0];
			var hintObj : Hint = new Hint(hint, xPos, yPos, 24);
			
			// Move in proportion to the new image
			hintObj.x = hintObj.x - (hintObj.width * 0.5);
			hintObj.y = hintObj.y - (hintObj.height * 0.5);
			
			return getWireOrder(hint);
		}
		
		public function getWireOrder(str:String) : Array
		{
			switch(str)
			{
				case rg0:
				case rg1:
				case rg2:
				case rg3:
					trace("WE GOT HERE, THE STR: " + str);
					return new Array(0xFF0000, 0x00FF00);
					break;
				case gr0:
				case gr1:
				case gr2:
				case gr3:
					trace("NOPE WE GOT HERE, THE STR: " + str);
					return new Array(0x00FF00, 0xFF0000);
					break;
				case rgb:
					return new Array(0xFF0000, 0x00FF00, 0x0000FF);
				case rbg:
					return new Array(0xFF0000, 0x0000FF, 0x00FF00);
				case bgr:
					return new Array(0x0000FF, 0x00FF00, 0xFF0000);
				case brg:
					return new Array(0x0000FF, 0xFF0000, 0x00FF00);
				case grb:
					return new Array(0x00FF00, 0xFF0000, 0x0000FF);
				case gbr:
					return new Array(0x00FF00, 0x0000FF, 0xFF0000);
				case rbgo:
					return new Array(0xFF0000, 0x0000FF, 0x00FF00, 0xFF9900);
				case rgob:
					return new Array(0xFF0000, 0x00FF00, 0xFF9900, 0x0000FF);
				case grbo:
					return new Array(0x00FF00, 0xFF0000, 0x0000FF, 0xFF9900);
				case gobr:
					return new Array(0x00FF00, 0xFF9900, 0x0000FF, 0xFF0000);
				case borg:
					return new Array(0x0000FF, 0xFF9900, 0xFF0000, 0x00FF00);
				case bgro:
					return new Array(0x0000FF, 0x00FF00, 0xFF0000, 0xFF9900);
				case orbg:
					return new Array(0xFF9900, 0xFF0000, 0x0000FF, 0x00FF00);
				case ogbr:
					return new Array(0xFF9900, 0x00FF00, 0x0000FF, 0xFF0000);
			}
			
			return null;
		}
		
		//-------------------------| EASY HINTS |-------------------------//
		private const rg0 : String = "My father and grandfather have fought and bled in previous wars, so I guess it was just my turn to go.";
		private const rg1 : String = "I stopped at a light on my way to school one day and started imagining myself wearing all camoflague and driving a big humvee.";
		private const rg2 : String = "I thought about holding a gun, about shooting another person. I thought about how the military could pay for college, too.";
		private const rg3 : String = "I brought roses for my girlfriend on my last week. She was already wearing an olive shirt saying Proud Wife of a Marine.";
		private const gr0 : String = "I was playing catch on the school field with an old friend when he asked, Are you really joining the marines? I said yes, and threw the ball.";
		private const gr1 : String = "While I was packing, I saw my mother outside on the lawn, right near our big apple tree. I think she was praying.";
		private const gr2 : String = "The recruiter in the camo shook his head. This isn't WW2, he said, we have better technology. The chances of you getting shot are pretty slim.";
		private const gr3 : String = "I never succeeded much at school, I was much better on the field with a ball. Maybe I'll be good with a gun too.";
			
		//-------------------------| MEDIUM HINTS |-------------------------//
		private const rgb : String = "I didn't realize but there was a big blood blotch on my camo pants. I had to remember to clean them or else the sergeant would kill me.";
		private const rbg : String = "We had spaghetti with marinara that night. Tomorrow we had endurance training in the freezing beach water. Then after that, survival training in the woods.";
		private const bgr : String = "Running along the beach side, our feet splashed in the tide and made our camo wet. One, Two, Three, Four, God bless the Marine Corps.";
		private const brg : String = "Hydration would be extremely important when we were out in Iraq. It's better to be shot than to die of dehydration, said the sergeant.";
		private const grb : String = "I thought I had an infection on my arm from cutting it earlier that week, but the doctor cleaned it. Marines don't get infections, he said.";
		private const gbr : String = "I didn't have too much money, but I used what I had to send my girlfriend Irises through the mail. I was mad when I didn't hear a reply.";
		
		//-------------------------| HARD HINTS |-------------------------//
		private const rbgo : String = "I shot a little girl who was holding something questionable in her hand. Turns out it was just water. The dark green plastic bottle made it look like an IED, it's hard to see when everything looks so dusty.";
		private const rgob : String = "I watched an IED blow the head off of a highly-skilled green beret I had just met several hours prior. All I remember was the bloody base of his neck covered in dust and a spray of water from what's left of his canteen.";
		private const grbo : String = "I would have given anything to see a tree or plants. There's nothing except to get sunburnt, hydrate, and everything gets covered in dust. No wonder these people are always angry, they live in a shithole.";
		private const gobr : String = "This isn't your daddy's war in the Jungle, our sergeant said, it's the desert. Make sure to hydrate, and watch the road for any IEDs.";
		private const borg : String = "The sky here in the desert looks exactly like it does in Ohio. It's sometimes equally boring here too. I would pray for someone to come fight us, but instead they just took our money for cheap trinquetes.";
		private const bgro : String = "In my survival pack I had several bottles of water, some money to buy things in the local marketplaces, and a first-aid kit for treating wounds, all of which was covered in dust. The dust gets everywhere.";
		private const orbg : String = "In the desert, there's really not much shooting, just bombs. Waiting, drinking water, more waiting, then BOOM! Your friend gets a one way ticket back to lush North Carolina sans his legs.";
		private const ogbr : String = "After patrolling in miles of rock and dust, we came across an opium field. Our orders were to burn it, and we did. While the smoke started rising towards the sky, my buddy said how we were burning millions of dollars.";
	}
}

class SingletonEnforcer
{
	
}