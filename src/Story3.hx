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

class Story3 extends Component
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
		System.root.add(new GameGammaStage());
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
		
		var text = new Entity().add(new TextBlurb("The colorful and soft gold was absorbed by your body", 100, 100));
		entTextHolder.addChild(text);
		
		var text = new Entity().add(new TextBlurb("You panic and start slightly sobbing.", 100, 140));
		entTextHolder.addChild(text);
		
		var text = new Entity().add(new TextBlurb("A sweet smell suddenly wafts from another cave nearby.", 100, 180));
		entTextHolder.addChild(text);
		
		var text = new Entity().add(new TextBlurb("Smells like... Potato?", 100, 220));
		entTextHolder.addChild(text);
		
		
		
		
		
		
		
		
		
	}
	
}