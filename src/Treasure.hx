package ;
import flambe.Component;
import flambe.display.FillSprite;
import flambe.math.Rectangle;

/**
 * ...
 * @author Vrian Candelaria
 */

class Treasure extends Component
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
		var sprImage = new FillSprite(0xcdad00, 32, 32);
		sprImage.setXY(floatMyx, floatMyy);
		owner.add(sprImage);
	}
	
	public function sayHitbox():Rectangle
	{
		var myHitBox = new Rectangle(floatMyx, floatMyy, 32, 32);
	}
}