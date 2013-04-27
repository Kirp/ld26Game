package ;
import flambe.Component;
import flambe.display.Sprite;

/**
 * ...
 * @author Vrian Candelaria
 */

class Movable extends Component
{
	public var boolCanMove:Bool = true;
	public var intMovementDirection:Int = 1;

	public function new() 
	{
		
	}
	
	public function stop():Void
	{
		boolCanMove = false;
	}
	
	public function move():Void
	{
		boolCanMove = true;
	}
	
	override public function onUpdate(dt:Float):Dynamic 
	{
		super.onUpdate(dt);
		if (boolCanMove)
		{	
			var generateRect = owner.get(Hero).sayHitBox();
			generateRect.x += ConstantHolder.GRAVITYVELOCITY * intMovementDirection;
			if (GameAlphaStage.isRectangleCollidingWithStageList(generateRect) == false)
			{
				owner.get(Sprite).x._ += ConstantHolder.GRAVITYVELOCITY *intMovementDirection;
			}else intMovementDirection *= -1;
		}
	}
}