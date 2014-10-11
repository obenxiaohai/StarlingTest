package
{
	import flash.display.Sprite;
	
	import APPLaunch.Main;
	
	import starling.core.Starling;

	[SWF(width="512",height="512",frameRate="60",backgroundColor="#00a0cc")]
	public class StarlingTest extends Sprite
	{
		private var _starling:Starling;
		public function StarlingTest()
		{
			Starling.multitouchEnabled = true;
			_starling = new Starling(Main,stage);
			_starling.start();
			_starling.viewPort.width = 512;
			_starling.viewPort.height = 512;
		}
	}
}