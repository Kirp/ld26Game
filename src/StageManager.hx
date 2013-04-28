package ;
import flambe.Component;
import flambe.display.Sprite;
import flambe.Entity;
import flambe.math.Rectangle;

/**
 * ...
 * @author Vrian Candelaria
 */

class StageManager extends Component
{
	public var sprMainSprite:Sprite;
	public var arrCollidableBlockList:Array<Entity> ;
	
	public function new() 
	{
		//init arrays
		arrCollidableBlockList = [];
	}
	
	override public function onAdded():Dynamic 
	{
		super.onAdded();
		owner.add(sprMainSprite = new Sprite());
		
	}
	
	public function addBlock(_x:Float, _y:Float, wid:Float, hei:Float):Dynamic
	{
		var genEnt = new Entity().add(new CollidableBlock(_x, _y, wid, hei));
		arrCollidableBlockList.push(genEnt);
		owner.addChild(genEnt);
	}
	
	public function addColumn(_x:Float, _y:Float, wid:Float, hei:Float, columnHeight:Int):Dynamic
	{
		for (len in 0...columnHeight)
		{
			var genEnt = new Entity().add(new CollidableBlock(_x, _y +(len*hei), wid, hei));
			arrCollidableBlockList.push(genEnt);
			owner.addChild(genEnt);
		}
	}
	
	public function addRow(_x:Float, _y:Float, wid:Float, hei:Float, columnWidth:Int):Dynamic
	{
		for (len in 0...columnWidth)
		{
			var genEnt = new Entity().add(new CollidableBlock(_x+(len*wid), _y, wid, hei));
			arrCollidableBlockList.push(genEnt);
			owner.addChild(genEnt);
		}
	}
	
	public function sayHitBoxList():Array<Entity>
	{
		return arrCollidableBlockList;
	}
	
	public function isRectangleCollidingWithStageList(checker:Rectangle):Bool
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