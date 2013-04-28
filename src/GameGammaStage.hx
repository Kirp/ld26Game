package ;

/**
 * ...
 * @author Vrian Candelaria
 */

class GameGammaStage extends GameAlphaStage
{

	public function new() 
	{
		super();
		pointStartingPointPlayer.set(100, 512);
		pointTreasureSpawn.set(1152, 32);
		intTreasureType = 3;
	}
	
	override public function loadUpStage():Void 
	{
		var stageManager = entStageManager.get(StageManager);
		
		stageManager.addColumn(0, 0, 64, 64, 10);
		stageManager.addColumn(0, -1280, 64, 64,20);
		stageManager.addRow(64, 576,  64,  64, 10);
		stageManager.addBlock(704, 512, 64, 64);
		stageManager.addBlock(448, 384, 64, 64); //helper
		
			//stageManager.addBlock(768, 512, 64, 64); //delete this cheat block
		
		stageManager.addBlock(2048, 512, 64, 64);	
		stageManager.addRow(768, 576, 64, 64, 20);
			stageManager.addBlock(1344, 512, 64, 64); //temp
		stageManager.addColumn(2048, 0, 64, 64, 8);	
		stageManager.addRow(832, 448, 64, 64, 10);
		stageManager.addRow(1536, 448, 64, 64, 7);
		
		stageManager.addColumn(832, 0, 64, 64, 6);
		stageManager.addRow(896, 320, 64, 64, 17);
		stageManager.addBlock(1728, 256, 64, 64);
		
		stageManager.addRow(960, 128, 64, 64, 3);
		stageManager.addRow(1152, 64, 64, 64, 4);
		stageManager.addColumn(1408, 0, 64, 64, 3);
		
		
		
	}
	
}