package ;
import flambe.Component;
import flambe.display.Sprite;
import flambe.Entity;
import flambe.System;

/**
 * ...
 * @author Vrian Candelaria
 */

class CameraControl extends Component
{ 
	public var floatCameraValueX:Float = 0;
	public var floatCameraValueY:Float = 0;
	public var sprTarget:Sprite;
	
	public var floatLeftborder:Float;
	public var floatRightborder:Float;
	public var floatTopborder:Float;
	public var floatBotborder:Float;
	
	public function new() 
	{
		var stageWidth = System.stage.width;
		var stageHeight = System.stage.height;
		trace(stageWidth + " : " +stageHeight);
		floatLeftborder = stageWidth * 0.4;
		floatRightborder = stageWidth * 0.6;
		floatTopborder = stageHeight * 0.2;
		floatBotborder = stageHeight * 0.6;
	}
	
	override public function onAdded():Dynamic 
	{
		super.onAdded();
		
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
		reset();
		trace("Camera ready");
	}
	
	public function reset():Void
	{
		var sprOwner = owner.get(Sprite);
		sprOwner.x._ = 0;
		floatCameraValueX = ((System.stage.width / 2) - sprTarget.x._)*-1;
		sprOwner.y._ =  0;
		floatCameraValueY = ((System.stage.height / 2) - sprTarget.y._)*-1;
		updateCameraPosition();
	}
	
	override public function onUpdate(dt:Float):Dynamic 
	{	
		super.onUpdate(dt);
		if (sprTarget != null)
		{
			if (sprTarget.x._ > floatCameraValueX+floatRightborder)
			{
				floatCameraValueX += ConstantHolder.WALKSPEED;
				updateCameraPosition();
			}else
				if(sprTarget.x._ < floatCameraValueX+floatLeftborder)
				{
					floatCameraValueX -= ConstantHolder.WALKSPEED;
					updateCameraPosition();
				}
				
			if (sprTarget.y._ > floatCameraValueY+floatBotborder)
			{
				floatCameraValueY += ConstantHolder.GRAVITYVELOCITY;
				updateCameraPosition();
			}else
				if(sprTarget.y._ < floatCameraValueY+floatTopborder)
				{
					floatCameraValueY -= ConstantHolder.JUMPSPEED;
					updateCameraPosition();
				}
		}
		
	}
	
	
	
}