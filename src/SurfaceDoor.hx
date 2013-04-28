package ;
import flambe.Component;
import flambe.display.FillSprite;
import flambe.display.Sprite;
import flambe.math.Rectangle;

/**
 * ...
 * @author Vrian Candelaria
 */

class SurfaceDoor extends Component
{
	public var floatMyx:Float;
	public var floatMyy:Float;

	public function new(_x:Float, _y:Float ) 
	{
		floatMyx = _x;
		floatMyy = _y;
	}
	
	override public function onAdded():Dynamic 
	{
		super.onAdded();
		var sprDoor = new TileSheetDisplayScriptedAnimation(64, 64, AssetHolder.pack.getTexture("StageTiles64x64"));
		sprDoor.setXY(floatMyx, floatMyy);
		sprDoor.switchTileDisplay(1);
		owner.add(sprDoor);
	}
	
	public function sayHitbox():Rectangle
	{	
		var myHitbox = new Rectangle(owner.get(Sprite).x._, owner.get(Sprite).y._, 64, 64);
		return myHitbox;
	}
	
}