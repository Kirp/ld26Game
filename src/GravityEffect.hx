package ;
import flambe.Component;
import flambe.display.Sprite;
import flambe.math.Rectangle;

/**
 * ...
 * @author Vrian Candelaria
 */

class GravityEffect extends Component
{
	public var boolOnGround:Bool = false;
	public var boolIsJumping:Bool = false;

	public function new() 
	{
		
	}
	
	override public function onAdded():Dynamic 
	{
		super.onAdded();
		
	}
	
	public function Jumping():Void
	{
		boolIsJumping = true;
		boolOnGround = false;
	}
	
	public function stoppedJumping():Void
	{
		boolIsJumping = false;
	}
	
	override public function onUpdate(dt:Float):Dynamic 
	{
		super.onUpdate(dt);
		if (boolIsJumping == false)
		{
			pullWithGravity();
		}
	}
	
	public function pullWithGravity():Dynamic
	{
		var generateRect = owner.get(Hero).sayHitBox();
		generateRect.y += ConstantHolder.GRAVITYVELOCITY;
		if (GameAlphaStage.isRectangleCollidingWithStageList(generateRect) == false)
		{
			owner.get(Sprite).y._ += ConstantHolder.GRAVITYVELOCITY;
			boolOnGround = false;
		}else boolOnGround = true;
	}

	
}