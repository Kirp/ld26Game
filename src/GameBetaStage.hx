package ;
import flambe.System;

/**
 * ...
 * @author Vrian Candelaria
 */

class GameBetaStage extends GameAlphaStage
{

	public function new() 
	{
		super();
		pointStartingPointPlayer.set(100, 512);
		pointTreasureSpawn.set(256, -608);
		intTreasureType = 1;
	}
	
	override public function loadUpStage():Void 
	{
		var stageManager = entStageManager.get(StageManager);
		
		stageManager.addColumn(0, 0, 64, 64, 10);
		stageManager.addColumn(0, -1280, 64, 64,20);
		stageManager.addRow(64, 576,  64,  64, 10);
		stageManager.addBlock(640, 256, 64, 64);
		stageManager.addBlock(704, 512, 64, 64);
		stageManager.addRow(704, 448,  64,  64, 3);
		stageManager.addRow(896, 256,  64,  64, 2);
		stageManager.addRow(1024, 128,  64,  64, 1);
		stageManager.addRow(1408, 576,  64,  64, 5);
		stageManager.addBlock(1728, 512, 64, 64);
		stageManager.addRow(1792, 576,  64,  64, 8);
		stageManager.addColumn(2304, 0, 64, 64, 10);
		stageManager.addColumn(2304, -1280, 64, 64, 19);
		
		stageManager.addBlock(2240, 448, 64, 64);
		stageManager.addBlock(2112, 320, 64, 64);
		stageManager.addBlock(2240, 192, 64, 64);
		stageManager.addBlock(2112, 64, 64, 64);
		stageManager.addBlock(2048, 128, 64, 64);//assist
		
		stageManager.addRow(1792, 0, 64, 64, 5);
		stageManager.addRow(1536, -64, 64, 64, 5);
		stageManager.addColumn(1344, 0, 64, 64,3);
		
		stageManager.addRow(1152, -192, 64, 64, 5);
		
		
		stageManager.addRow(768, -192, 64, 64, 5);
		stageManager.addRow(384, -320, 64, 64, 5);
		stageManager.addRow(64, -384, 64, 64, 5);
		stageManager.addBlock(768, -512, 64, 64);
		stageManager.addBlock(128, -448, 64, 64);
		stageManager.addBlock(64, -576, 64, 64);
		stageManager.addRow(192, -576, 64, 64, 5);
		stageManager.addBlock(192, -640, 64, 64);
		stageManager.addBlock(192, -704, 64, 64);
		stageManager.addColumn(448, -768, 64, 64, 3);
		
		
		
		
	}
	
	override public function exitToStory():Void 
	{ 
		System.root.removeChild(entMainStageHolder);
		System.root.remove(this);
		System.root.add(new Story3());
	}
	
}