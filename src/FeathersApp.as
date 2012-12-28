package
{
	import flash.display.Sprite;
	
	import starling.core.Starling;
	
	[SWF(width="640" height="960" frameRate="60")]
	public class FeathersApp extends Sprite
	{
		public function FeathersApp()
		{
			var starling:Starling = new Starling(Main, stage);
			starling.start();
		}
	}
}