package
{
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import feathers.controls.Header;
	import feathers.controls.List;
	import feathers.controls.Screen;
	import feathers.data.ListCollection;
	import feathers.skins.StandardIcons;
	
	import starling.events.Event;
	import starling.textures.Texture;
	
	public class PersonList extends Screen
	{
		private var header:Header;
		private var list:List;
		private var loader:URLLoader;
		
		public function PersonList()
		{
			
		}
		
		override protected function draw():void
		{
			// TODO Auto Generated method stub
			header.width = actualWidth;
			
			list.y = header.height;
			list.width = actualWidth;
			list.height = actualHeight - header.height;
			
			
			
		}
		
		override protected function initialize():void
		{
			header = new Header();
			header.title = "Gaming Team";
			addChild(header);
			
			loader = new URLLoader(new URLRequest("team.json"));
			loader.addEventListener(flash.events.Event.COMPLETE, done);
			
			list = new List();
			addChild(list);
		}
		
		protected function done(event:flash.events.Event):void
		{
			
			var obj:Object = JSON.parse(loader.data);
			list.dataProvider = new ListCollection(obj.people);
			
			list.itemRendererProperties.labelField = "name";
			list.itemRendererProperties.accessoryTextureFunction = function(item:Object):Texture {
					return StandardIcons.listDrillDownAccessoryTexture;
				}

			list.addEventListener(starling.events.Event.CHANGE, listChanged)	
		}		
		
		private function listChanged(e:starling.events.Event):void
		{
			dispatchEventWith("listSelected", false, list.selectedItem)
			
		}		
		
	}
}