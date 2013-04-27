package ;
import flambe.Component;
import flambe.display.Sprite;
import flambe.Entity;

/**
 * ...
 * @author Vrian Candelaria
 */

class CameraControl extends Component
{
	public var floatCameraValueX:Float = 0;
	public var floatCameraValueY:Float = 0;
	public var sprTarget:Sprite;
	
	public function new() 
	{
		
	}
	
	public function updateCameraPosition():Void
	{
		var sprOwner = owner.get(Sprite);
		sprOwner.x._ = floatCameraValueX * -1;
		sprOwner.y._ = floatCameraValueY * -1;
		
	}
	
	public function setTarget(sprTarg:Sprite):Void
	{
		sprTarget = sprTarg;
		trace("Camera ready");
	}
	
	override public function onUpdate(dt:Float):Dynamic 
	{	
		super.onUpdate(dt);
		if (sprTarget != null)
		{
			if (sprTarget.x._ > floatCameraValueX+1000)
			{
				floatCameraValueX += ConstantHolder.WALKSPEED + 1;
				updateCameraPosition();
			}else
				if(sprTarget.x._ < floatCameraValueX+200)
				{
					floatCameraValueX -= ConstantHolder.WALKSPEED +1;
					updateCameraPosition();
				}
		}
	}
	
}