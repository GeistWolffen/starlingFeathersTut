package
{
	import feathers.controls.Screen;
	import feathers.controls.ScreenNavigator;
	import feathers.controls.ScreenNavigatorItem;
	import feathers.motion.transitions.ScreenSlidingStackTransitionManager;
	import feathers.themes.MetalWorksMobileTheme;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Main extends Sprite
	{
		private static const PERSON_LIST:String = "personList";
		private static const PERSON_DETAILS:String = "personDetails";
		private var nav:ScreenNavigator;
		public static var selectedItem:Object;
		public function Main()
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event): void {
			
			var theme:MetalWorksMobileTheme = new MetalWorksMobileTheme(stage);
			
			nav = new ScreenNavigator();
			addChild(nav);
			
			var plist:ScreenNavigatorItem = new ScreenNavigatorItem(PersonList, {listSelected: selected}, null);
			nav.addScreen(PERSON_LIST, plist);
			
			var details:ScreenNavigatorItem = new ScreenNavigatorItem(PersonDetails, {complete: PERSON_LIST}, null);
			nav.addScreen(PERSON_DETAILS, details);
			
			nav.showScreen(PERSON_LIST);
			
			
			var transition:ScreenSlidingStackTransitionManager = new ScreenSlidingStackTransitionManager(nav);
		}
		
		private function selected(e:Event, si:Object):void {
			
			selectedItem = si;
			nav.showScreen(PERSON_DETAILS);
		}
	}
}