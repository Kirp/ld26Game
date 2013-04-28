package ;
import flambe.Component;
import flambe.display.FillSprite;
import flambe.display.Sprite;
import flambe.math.Rectangle;

/**
 * ...
 * @author Vrian Candelaria
 */

class Treasure extends Component
{
	public var floatMyx:Float;
	public var floatMyy:Float;
	public var boolIsTaken:Bool = false;
	public var intFace:Int;
	
	public function new(_x:Float, _y:Float, face:Int = 0) 
	{
		floatMyx = _x;
		floatMyy = _y;
		intFace = face;
	}
	
	override public function onAdded():Dynamic 
	{
		super.onAdded();
		var sprImage = new TileSheetDisplayScriptedAnimation(32, 32, AssetHolder.pack.getTexture("pickupItemTiles32x32"));
		sprImage.setXY(floatMyx, floatMyy);
		sprImage.switchTileDisplay(intFace);
		owner.add(sprImage);
	}
	
	public function sayHitbox():Rectangle
	{
		if (boolIsTaken == true) return null;
		var myHitBox = new Rectangle(floatMyx, floatMyy, 32, 32);
		return myHitBox;
	}
	
	public function taken():Dynamic
	{
		boolIsTaken = true;
		owner.get(Sprite).visible = false;
	}
	
	public function released():Dynamic
	{
		boolIsTaken = false;
		owner.get(Sprite).visible = true;
	}
	
	public function moveTo(_x:Float, _y:Float):Dynamic
	{
		floatMyx = _x;
		floatMyy = _y;
		owner.get(Sprite).setXY(floatMyx, floatMyy);
	}
}