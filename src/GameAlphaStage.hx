package ;
import flambe.Component;
import flambe.display.FillSprite;
import flambe.display.Sprite;
import flambe.Entity;
import flambe.input.PointerEvent;
import flambe.math.Rectangle;
import flambe.System;
import flambe.util.SignalConnection;

/**
 * ...
 * @author Vrian Candelaria
 */

class GameAlphaStage extends Component
{
	public var entMainStageHolder:Entity;
	public var entStageManager:Entity;
	public var entPlayer:Entity;
	public static var arrCollidableBlockList:Array<Entity>;
	
	public var scPointerClick:SignalConnection;
	public var scPointerRelease:SignalConnection;
	
	public function new() 
	{
		//initiate those that need to 
		arrCollidableBlockList = [];
		scPointerClick = System.pointer.down.connect(onPointerClick);
		scPointerRelease = System.pointer.up.connect(onPointerRelease);
	}
	
	private function onPointerRelease(event:PointerEvent) 
	{
		trace("released");
		entPlayer.get(Jumper).stopJump();
	}
	
	private function onPointerClick(event:PointerEvent) 
	{
		trace("clicking or touching");
		entPlayer.get(Jumper).jump();
	}
	
	override public function onAdded():Dynamic 
	{
		super.onAdded();
	
		entMainStageHolder = new Entity().add(new Sprite());
		entMainStageHolder.add(new CameraControl());
		owner.addChild(entMainStageHolder);
		
		var sprBG = new FillSprite(0x303030, System.stage.width, System.stage.height);
		entMainStageHolder.addChild(new Entity().add(sprBG));
		
		entStageManager = new Entity().add(new StageManager());
		entMainStageHolder.addChild(entStageManager);
		
		var stageManager = entStageManager.get(StageManager);
		stageManager.addBlock(10, 300, 100, 100);
		stageManager.addBlock(100, 350, 100, 100);
		stageManager.addBlock(200, 350, 100, 100);
		stageManager.addBlock(300, 350, 100, 100);
		stageManager.addBlock(400, 350, 100, 100);
		stageManager.addBlock(500, 350, 100, 100);
		stageManager.addBlock(600, 350, 100, 100);
		stageManager.addBlock(700, 350, 100, 100);
		stageManager.addBlock(800, 350, 100, 100);
		stageManager.addBlock(900, 300, 100, 100);
		stageManager.addBlock(1000, 300, 100, 100);
		stageManager.addBlock(1100, 300, 100, 100);
		stageManager.addBlock(1200, 300, 100, 100);
		
		
		//load up player
		entStageManager.addChild(entPlayer = new Entity().add(new Hero(200, 300)));
		entPlayer.add(new Jumper());
		
		entMainStageHolder.get(CameraControl).setTarget(entPlayer.get(Sprite));
		
		arrCollidableBlockList = stageManager.sayHitBoxList(); //keep this line at the end of adding stage blocks for collision purposes
	}
	
	public static function isRectangleCollidingWithStageList(checker:Rectangle):Bool
	{
		var SideX:Bool = false;
		var SideY:Bool = false;
		var finalB:Bool = false;
		var rectCheck:Rectangle = checker;
		
		for (entStage in arrCollidableBlockList)
		{
			var Top:Bool = false;
			var Bot:Bool = false;
			var Left:Bool = false;
			var Right:Bool = false;
			
			var sprStage = entStage.get(Sprite);
			var hwStage = entStage.get(CollidableBlock);
			
			if (rectCheck.y > sprStage.y._ ||
				rectCheck.y + rectCheck.height > sprStage.y._)
				{
					Top = true;
				}
			
			if (rectCheck.y  < sprStage.y._ +hwStage.rectMainBody.height ||
				rectCheck.y + rectCheck.height < sprStage.y._+hwStage.rectMainBody.height)
				{
					Bot = true;
				}
				
			if (rectCheck.x > sprStage.x._ ||
				rectCheck.x + rectCheck.width > sprStage.x._)
				{
					Left = true;
				}
				
			if (rectCheck.x < sprStage.x._ +hwStage.rectMainBody.width ||
				rectCheck.x+rectCheck.width < sprStage.x._ + hwStage.rectMainBody.width)
				{
					Right = true;
				}
			
			if ((Top && Bot) && (Left && Right)) finalB = true;
		}
		return finalB;
	}
	
}