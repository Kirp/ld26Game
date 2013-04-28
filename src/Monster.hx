package ;
import flambe.Component;
import flambe.display.ImageSprite;

/**
 * ...
 * @author Vrian Candelaria
 */

class Monster extends Component
{
	public var floatMyx:Float;
	public var floatMyy:Float;
	

	public function new(_x:Float, _y:Float) 
	{
		floatMyx = _x;
		floatMyy = _y;
	}
	
	override public function onAdded():Dynamic 
	{
		super.onAdded();
		var sprImage = new ImageSprite(AssetHolder.pack.getTexture("characterTemplate32x32"));
		sprImage.setXY(floatMyx, floatMyy);
		owner.add(sprImage);
	}
	
}