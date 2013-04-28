package ;
import flambe.Component;
import flambe.display.Sprite;
import flambe.Entity;
import flambe.input.PointerEvent;
import flambe.System;
import flambe.util.SignalConnection;

/**
 * ...
 * @author Vrian Candelaria
 */

class TitleScreen extends Component
{
	public var scPointerClick:SignalConnection;
	public var sprMyspr:Sprite;
	public var entTextHolder:Entity;	
	
	public function new() 
	{
		scPointerClick = System.pointer.down.connect(onPointerClick);
	}
	
	private function onPointerClick(event:PointerEvent) 
	{
		owner.removeChild(entTextHolder);
		System.root.remove(this);
		System.root.add(new Story1());
		this.dispose();
	}
	
	override public function onAdded():Dynamic 
	{
		super.onAdded();
		
		entTextHolder = new Entity().add(new Sprite());
		owner.addChild(entTextHolder);
		
		var text = new Entity().add(new TextBlurb("A simple Story of a simple cube", 100, 100));
		entTextHolder.addChild(text);
		
		var text = new Entity().add(new TextBlurb("Click anywhere to start", 100, 300));
		entTextHolder.addChild(text);
	}
	
	override public function onRemoved():Dynamic 
	{
		super.onRemoved();
		scPointerClick.dispose();
		
	}
}