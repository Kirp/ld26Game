package ;
import flambe.Component;
import flambe.display.FillSprite;
import flambe.display.Sprite;
import flambe.Entity;
import flambe.System;

/**
 * ...
 * @author Vrian Candelaria
 */

class GameAlphaStage extends Component
{
	public var entMainStageHolder:Entity;
	public var entStageManager:Entity;
	
	public function new() 
	{
		
	}
	
	override public function onAdded():Dynamic 
	{
		super.onAdded();
		entMainStageHolder = new Entity().add(new Sprite());
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
		
		entStageManager.addChild(new Entity().add(new Hero(200,300)));
	}
	
}