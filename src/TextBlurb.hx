package ;
import flambe.Component;
import flambe.display.Font;
import flambe.display.Sprite;
import flambe.display.TextSprite;
import flambe.Entity;

/**
 * ...
 * @author Vrian Candelaria
 */

class TextBlurb extends Component
{
	public var font:Font;
	public var say:String;
	public var floatMyx:Float;
	public var floatMyy:Float;
	
	public function new(sayThis:String, _x:Float, _y:Float) 
	{
		font = new Font(AssetHolder.pack, "handel");
		say = sayThis;
	}
	
	override public function onAdded():Dynamic 
	{
		super.onAdded();
		var sprBG = new Sprite();
		sprBG.setXY(floatMyx, floatMyy);
		owner.add(sprBG);
		
		var sprText = new TextSprite(font, say);
		owner.addChild(new Entity().add(sprText));
		
	}

	
}