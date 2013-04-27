package ;
import flambe.Component;
import flambe.display.FillSprite;

/**
 * ...
 * @author Vrian Candelaria
 */

class Hero extends Component
{	
	public var mySprite:FillSprite;
	public var floatStartingPointx:Float = 0;
	public var floatStartingPointy:Float = 0;
	
	public function new(_x:Float, _y:Float) 
	{
		floatStartingPointx = _x;
		floatStartingPointy = _y;
	}
	
	override public function onAdded():Dynamic 
	{
		super.onAdded();
		owner.add(mySprite = new FillSprite(0x000099, 32, 32));
		mySprite.setXY(floatStartingPointx, floatStartingPointy);
	}
}