package ;
import flambe.Component;
import flambe.display.FillSprite;
import flambe.display.ImageSprite;
import flambe.math.Rectangle;

/**
 * ...
 * @author Vrian Candelaria
 */

class Hero extends Component
{	
	public var floatMyWidth:Float = 32;
	public var floatMyHeight:Float = 32;
	public var mySprite:ImageSprite;
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
		owner.add(mySprite = new ImageSprite(AssetHolder.pack.getTexture("squareFaceTemplate32x32")));
		mySprite.setXY(floatStartingPointx, floatStartingPointy);
		owner.add(new MovableEntityData(floatMyWidth, floatMyHeight));
		owner.add(new GravityEffect());
		owner.add(new Movable());
		owner.add(new LootBag());
	}
	
	public function sayHitBox():Rectangle
	{
		var myHitBox = new Rectangle(mySprite.x._, mySprite.y._, floatMyWidth, floatMyHeight);
		return myHitBox;
	}
	
	public function reset(_x:Float, _y:Float):Void
	{
		mySprite.setXY(_x, _y);
	}
}