package
{
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import feathers.controls.Button;
	import feathers.controls.Header;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.Screen;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.events.Event;
	
	public class PersonDetails extends Screen
	{
		private var header:Header;
		private var blog:Label;
		private var twitter:Label;		
		private var backButton:Button;
		public function PersonDetails()
		{
			
		}
		
		override protected function draw():void
		{
			// TODO Auto Generated method stub
			header.width = actualWidth;
			blog.y = header.height + 20;
			blog.x = 20;
			
			twitter.y = blog.y + 20;
			twitter.x = 20;
			
		}
		
		override protected function initialize():void
		{
			header = new Header();
			header.title = Main.selectedItem.name;
			addChild(header);
			
			backButton = new Button();
			backButton.label = "Back";
			backButton.addEventListener(starling.events.Event.TRIGGERED, onBack);
			
			header.leftItems = new <DisplayObject>[backButton];
			
			blog = new Label();
			blog.text = Main.selectedItem.blog;
			addChild(blog);
			
			twitter = new Label();
			twitter.text = Main.selectedItem.twitter;
			addChild(twitter);
			
			
			
			
			
		}		
		
		private function onBack(e:starling.events.Event):void
		{
			// TODO Auto Generated method stub
			dispatchEventWith("complete");
			
		}
	}
}