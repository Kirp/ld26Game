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
			owner.get(Sprite).y._ -= ConstantHolder.JUMPSPEED;
			
		} 
	}
	
	public function jump():Void
	{
		boolIsJumping = true;
		//jump
		owner.get(GravityEffect).Jumping();
	}
	
	public function stopJump():Void
	{
		boolIsJumping = false;
		//stop jump
		owner.get(GravityEffect).stoppedJumping();
	}
	
	
}