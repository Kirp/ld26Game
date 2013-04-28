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

class Story2 extends Component
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
		System.root.add(new GameBetaStage());
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
		
		var text = new Entity().add(new TextBlurb("The chest was full of stinky things and you dont think your master", 100, 100));
		entTextHolder.addChild(text);
		
		var text = new Entity().add(new TextBlurb("will like stinky things. Also you ate em.", 100, 140));
		entTextHolder.addChild(text);
		
		var text = new Entity().add(new TextBlurb("The Lich next door hides his gold in a cave near the local outhouse", 100, 180));
		entTextHolder.addChild(text);
		
		var text = new Entity().add(new TextBlurb("Perhaps master likes money?", 100, 220));
		entTextHolder.addChild(text);
		
		
		
		
		
		
		
		
		
	}
}