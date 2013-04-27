package ;
import flambe.Component;
import flambe.display.Sprite;

/**
 * ...
 * @author Vrian Candelaria
 */

class Jumper extends Component
{
	public var boolIsJumping:Bool = false;
	public var intJumpTime:Int = 0;
	
	public function new() 
	{
		
	}
	
	override public function onAdded():Dynamic 
	{
		super.onAdded();
	}
	
	override public function onUpdate(dt:Float):Dynamic 
	{
		super.onUpdate(dt);
		if (boolIsJumping)
		{
			if (intJumpTime < ConstantHolder.JUMPTIME)
			{
				owner.get(Sprite).y._ -= ConstantHolder.JUMPSPEED;
				intJumpTime++;
			}else 
				{
					intJumpTime = 0;
					stopJump();
				}
		} 
	}
	
	public function jump():Void
	{
		var grGravityData:GravityEffect = owner.get(GravityEffect);
		if (grGravityData.boolOnGround == true && boolIsJumping == false)
		{
			grGravityData.Jumping();
			boolIsJumping = true;
		}
	}
	
	public function stopJump():Void
	{
		boolIsJumping = false;
		//stop jump
		owner.get(GravityEffect).stoppedJumping();
	}
	
	
}