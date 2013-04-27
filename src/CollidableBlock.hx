package ;
import flambe.Component;
import flambe.display.FillSprite;
import flambe.Entity;
import flambe.math.Rectangle;

/**
 * ...
 * @author Vrian Candelaria
 */

class CollidableBlock extends Component
{
	public var rectMainBody:Rectangle;
	public var intCollideLayer:Int;
	public var entMainEnt:Entity;
	
	public function new(_x:Float, _y:Float, wid:Float, hei:Float, layer:Int = 1) 
	{
		rectMainBody = new Rectangle(_x, _y, wid, hei);
		intCollideLayer = layer;
	}
	
	override public function onAdded():Dynamic 
	{
		super.onAdded();
		var sprMainSprite = new FillSprite(0x330000, rectMainBody.width, rectMainBody.height); 
		sprMainSprite.setXY(rectMainBody.x, rectMainBody.y);
		owner.add(sprMainSprite);
		
	}
	
}