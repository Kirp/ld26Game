package ;
import flambe.Component;
import flambe.display.FillSprite;
import flambe.display.Sprite;
import flambe.Entity;
import flambe.input.PointerEvent;
import flambe.math.Point;
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
	
	public var pointStartingPointPlayer:Point;
	
	public function new() 
	{
		//initiate those that need to 
		arrCollidableBlockList = [];
		scPointerClick = System.pointer.down.connect(onPointerClick);
		scPointerRelease = System.pointer.up.connect(onPointerRelease);
		pointStartingPointPlayer = new Point(200,300);
	}
	
	private function onPointerRelease(event:PointerEvent) 
	{
		trace("released");
		//entPlayer.get(Jumper).stopJump();
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
		
		var sprBG = new FillSprite(0x303030, 5000, 5000);
		sprBG.x._ -= 800;
		entMainStageHolder.addChild(new Entity().add(sprBG));
		
		entStageManager = new Entity().add(new StageManager());
		entMainStageHolder.addChild(entStageManager);
		
		loadUpStage();
		
		
		
		//load up player
		entStageManager.addChild(entPlayer = new Entity().add(new Hero(pointStartingPointPlayer.x, pointStartingPointPlayer.y)));
		entPlayer.add(new Jumper());
		
		entMainStageHolder.get(CameraControl).setTarget(entPlayer.get(Sprite));
		
		arrCollidableBlockList = entStageManager.get(StageManager).sayHitBoxList(); //keep this line at the end of adding stage blocks for collision purposes
	}
	
	public function loadUpStage():Void
	{
		var stageManager = entStageManager.get(StageManager);
		
		stageManager.addColumn(0, 0, 64, 64, 10);
		stageManager.addRow(64, 576,  64,  64, 10);
		stageManager.addRow(704, 512,  64,  64, 3);
		stageManager.addColumn(1024, 512, 64, 64, 3);
		stageManager.addColumn(1216, 512, 64, 64, 3);
		stageManager.addColumn(1408, 512, 64, 64, 3);
		stageManager.addColumn(1600, 512, 64, 64, 3);
		stageManager.addRow(1792, 512,  64,  64, 4);
		stageManager.addRow(2048, 448,  64,  64, 1);
		stageManager.addRow(2176, 512,  64,  64, 4);
		stageManager.addRow(2368, 384,  64,  64, 4);
		stageManager.addRow(2624, 320,  64,  64, 1);
		stageManager.addRow(2048, 256,  64,  64, 4);
		
		//stageManager.addBlock(74, 364,  64,  64);
		//stageManager.addBlock(138, 350,  64,  64);
		//stageManager.addBlock(202, 350,  64,  64);
		//stageManager.addBlock(266, 350,  64,  64);
		//stageManager.addBlock(330, 350,  64,  64);
		//stageManager.addBlock(394, 350,  64,  64);
		//stageManager.addBlock(458, 350,  64,  64);
		//stageManager.addBlock(522, 350,  64,  64);
		//stageManager.addBlock(586, 300,  64,  64);
		//stageManager.addBlock(650, 300,  64,  64);
		//stageManager.addBlock(714, 300,  64,  64);
		//stageManager.addBlock(778, 300,  64,  64);
		//stageManager.addColumn(0, 0, 64, 64, 10);
		//stageManager.addRow(778, 300,  64,  64, 10);
		//stageManager.addRow(1610, 400,  64,  64, 10);
		//stageManager.addRow(2314, 300,  64,  64, 10);
		//stageManager.addColumn(2954, 0,  64,  64, 10);
		
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
	
	override public function onUpdate(dt:Float):Dynamic 
	{
		super.onUpdate(dt);
		if (entPlayer.get(Sprite).y._ > 700)
		{
			trace("reset");
			entPlayer.get(Hero).reset(pointStartingPointPlayer.x, pointStartingPointPlayer.y);
			entMainStageHolder.get(CameraControl).reset();
		}
	}
	
}