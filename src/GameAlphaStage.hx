package ;
import flambe.Component;
import flambe.display.FillSprite;
import flambe.display.PatternSprite;
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
	
	public var entDoor:Entity;
	public var entPlayer:Entity;
	public var entTreasure:Entity;
	public static var arrCollidableBlockList:Array<Entity>;
	
	public var scPointerClick:SignalConnection;
	public var scPointerRelease:SignalConnection;
	
	public var pointStartingPointPlayer:Point;
	public var pointTreasureSpawn:Point;
	public var intTreasureType:Int = 0;
	
	public function new() 
	{
		//initiate those that need to 
		arrCollidableBlockList = [];
		scPointerClick = System.pointer.down.connect(onPointerClick);
		scPointerRelease = System.pointer.up.connect(onPointerRelease);
		pointStartingPointPlayer = new Point(200, 512);
		pointTreasureSpawn = new Point(3840, 544);
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
		
		var sprBG = new FillSprite(0x000000, 1000, 1000);
		sprBG.x._ -= 800;
		sprBG.y._ -= 800;
		entMainStageHolder.addChild(new Entity().add(sprBG));
		
		
		entStageManager = new Entity().add(new StageManager());
		entMainStageHolder.addChild(entStageManager);
		
		loadUpStage();
		
		//load door
		entStageManager.addChild(entDoor = new Entity().add(new SurfaceDoor(pointStartingPointPlayer.x, pointStartingPointPlayer.y)));
		
		//load treasure
		entStageManager.addChild(entTreasure = new Entity().add(new Treasure(pointTreasureSpawn.x, pointTreasureSpawn.y, intTreasureType)));
		
		//test load a monster
		//entStageManager.addChild(new Entity().add(new Monster(200, 500)));
		
		//load up player
		entStageManager.addChild(entPlayer = new Entity().add(new Hero(pointStartingPointPlayer.x+64, pointStartingPointPlayer.y)));
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
		stageManager.addBlock(1472, 576, 64, 64);
		stageManager.addColumn(1600, 512, 64, 64, 3);
		stageManager.addRow(1792, 512,  64,  64, 4);
		stageManager.addRow(2048, 448,  64,  64, 1);
		stageManager.addRow(2176, 512,  64,  64, 4);
		stageManager.addRow(2368, 384,  64,  64, 4);
		stageManager.addRow(2624, 320,  64,  64, 1);
		stageManager.addColumn(2624, 192, 64, 64, 2);
		stageManager.addRow(2048, 256,  64,  64, 4);
		stageManager.addRow(1984, 192,  64,  64, 1);
		stageManager.addRow(2368, 128,  64,  64, 10);
		stageManager.addRow(3008, 576,  64,  64, 10);
		stageManager.addRow(3648, 512,  64,  64, 1); //place treasure between these
		stageManager.addRow(3712, 576,  64,  64, 5);
		stageManager.addColumn(4032, 0, 64, 64, 10); //that and this
		
		stageManager.addRow(2752, 384,  64,  64, 4); //exit strategerie
		stageManager.addRow(3072, 448,  64,  64, 1);
		stageManager.addColumn(2752, 256,  64,  64, 6);
		stageManager.addRow(2432, 512,  64,  64, 6);
		
		
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
	
	public static function isRectangleCollidingWithRectangle(checker:Rectangle, base:Rectangle):Bool
	{
		var SideX:Bool = false;
		var SideY:Bool = false;
		var finalB:Bool = false;
		var rectCheck:Rectangle = checker;
		
	
		var Top:Bool = false;
		var Bot:Bool = false;
		var Left:Bool = false;
		var Right:Bool = false;
		
		var sprStage = base;
		
		
		if (rectCheck.y > sprStage.y ||
			rectCheck.y + rectCheck.height > sprStage.y)
			{
				Top = true;
			}
		
		if (rectCheck.y  < sprStage.y +sprStage.height ||
			rectCheck.y + rectCheck.height < sprStage.y+sprStage.height)
			{
				Bot = true;
			}
			
		if (rectCheck.x > sprStage.x ||
			rectCheck.x + rectCheck.width > sprStage.x)
			{
				Left = true;
			}
			
		if (rectCheck.x < sprStage.x +sprStage.width ||
			rectCheck.x+rectCheck.width < sprStage.x + sprStage.width)
			{
				Right = true;
			}
		
		if ((Top && Bot) && (Left && Right)) finalB = true;
	
		return finalB;
	}
	
	public function checkIfTouchingDoor():Bool
	{
		var playerHB = entPlayer.get(Hero).sayHitBox();
		var doorHB = entDoor.get(SurfaceDoor).sayHitbox();
		return isRectangleCollidingWithRectangle(playerHB, doorHB);
	}
	
	public function checkIfTouchingTreasure():Bool
	{
		var playerHB = entPlayer.get(Hero).sayHitBox();
		var treasureHB = entTreasure.get(Treasure).sayHitbox();
		if (playerHB == null || treasureHB == null) return false;
		return isRectangleCollidingWithRectangle(playerHB, treasureHB);
	}
	
	
	override public function onUpdate(dt:Float):Dynamic 
	{
		super.onUpdate(dt);
		if (entPlayer.get(Sprite).y._ > 700)
		{
			trace("reset");
			entPlayer.get(Hero).reset(pointStartingPointPlayer.x, pointStartingPointPlayer.y);
			entMainStageHolder.get(CameraControl).reset();
			entPlayer.get(LootBag).dropLoot();
			entTreasure.get(Treasure).released();
		}
		
		if (checkIfTouchingDoor())
		{
			trace("Touching door!");
			if (entPlayer.get(LootBag).boolHasLoot == true)
			{
				trace("end of stage! winnar!");
				entPlayer.get(Movable).stop();
			}
		}
		
		if (checkIfTouchingTreasure())
		{
			trace("Touching treasure!");
			entPlayer.get(LootBag).gotLoot();
			entTreasure.get(Treasure).taken(); 
			
		}
			
	}
	
	override public function onRemoved():Dynamic 
	{
		super.onRemoved();
		scPointerClick.dispose();
		scPointerRelease.dispose();
	}
}