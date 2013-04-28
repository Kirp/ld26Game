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

class Story1 extends Component
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
		System.root.add(new GameAlphaStage());
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
		
		var text = new Entity().add(new TextBlurb("You are the favorite assistant of a great and powerful magician", 100, 100));
		entTextHolder.addChild(text);
		var text = new Entity().add(new TextBlurb("Even though you can only move endlessly forward as well as jump", 100, 140));
		entTextHolder.addChild(text);
		var text = new Entity().add(new TextBlurb("You try to help out your master as best as you could.",  100, 180));
		entTextHolder.addChild(text);
		var text = new Entity().add(new TextBlurb("A particular enchantment surrounds your gelatinous exterior",  100, 220));
		entTextHolder.addChild(text);
		var text = new Entity().add(new TextBlurb("It whisks you away to the nearest exit when you are in dire danger",  100, 260));
		entTextHolder.addChild(text);
		var text = new Entity().add(new TextBlurb("For this you are ever so grateful to your master and is now looking",  100, 300));
		entTextHolder.addChild(text);
		var text = new Entity().add(new TextBlurb("to fetch a gift in return. You have heard of a 'chest of eternal components'",  100, 340));
		entTextHolder.addChild(text);
		var text = new Entity().add(new TextBlurb("in this particular cave and you will not leave till you have it",  100, 380));
		entTextHolder.addChild(text);
		
		
		
		
		
	}
	
}