package ;
import flambe.Component;
import flambe.display.FillSprite;
import flambe.display.Sprite;
import flambe.Entity;
import flambe.input.PointerEvent;
import flambe.System;
import flambe.util.SignalConnection;
/**
 * ...
 * @author Vrian Candelaria
 */

class GameOverScreen extends Component
{
	public var scPointerClick:SignalConnection;
	public var entTextHolder:Entity;
	
	public function new() 
	{
		scPointerClick = System.pointer.down.connect(onPointerClick);
	}
	
	private function onPointerClick(event:PointerEvent) 
	{
		System.root.removeChild(entTextHolder);
		System.root.remove(this);
		System.root.add(new TitleScreen());
	}
	
	override public function onRemoved():Dynamic 
	{
		super.onRemoved();
		scPointerClick.dispose();
	}
	
	override public function onAdded():Dynamic 
	{	
		entTextHolder = new Entity().add(new Sprite());
		owner.addChild(entTextHolder);
		
		var text = new Entity().add(new TextBlurb("This Potato will be the best gift ever!", 100, 100));
		entTextHolder.addChild(text);
		
		var text = new Entity().add(new TextBlurb("With a song in your heart you head home to your master", 100, 140));
		entTextHolder.addChild(text);
		
		var text = new Entity().add(new TextBlurb("Thank you for playing! You totally win!", 100, 200));
		entTextHolder.addChild(text);
		
		var text = new Entity().add(new TextBlurb("A Ludum Dare 26 entry by Vrian G. Candelaria", 100, 250));
		entTextHolder.addChild(text);
		
	}
}