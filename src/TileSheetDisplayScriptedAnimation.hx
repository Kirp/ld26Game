package ;
import flambe.display.ImageSprite;
import flambe.display.Texture;
import flambe.math.Point;
import flambe.math.Rectangle;
import flambe.script.CallFunction;
import flambe.script.Delay;
import flambe.script.Repeat;
import flambe.script.Script;
import flambe.script.Sequence;
import flambe.System;

/**
 * ...
 * @author Vrian Candelaria
 * @version 1.4
 */

class AnimationFrames
{
	public var strAnimationName:String;
	public var arrAnimationTiles:Array<Int>;
	public var fltDelay:Float;
	public var boolRepeat:Bool;
	public var intCurrentPanel:Int = 0;
	public var intMaxPanelNumber:Int;

	
	
	public function new(name:String, animationTiles:Array<Int>, delayTime:Float, toRepeat:Bool)
	{	
		arrAnimationTiles = [];
		arrAnimationTiles = animationTiles;
		strAnimationName = name;
		fltDelay = delayTime;
		boolRepeat = toRepeat;
		intMaxPanelNumber = arrAnimationTiles.length -1;
		
	}
}


class TileSheetDisplayScriptedAnimation extends ImageSprite
{
	public var TileTexture:Texture;
	public var TileTargetWidth:Int= 10;
	public var TileTargetHeight:Int = 10;
	public var TileSheetTexture:Texture;
	public var arrAnimationSceneList:Array<AnimationFrames>;
	public var boolPlayScene:Bool = false;
	public var arrTileList:Array<Point>;
	public var intCellsPerWidth:Int = 0;
	public var intCellsPerheight:Int = 0;
	public var strCurrentPlaying:String = "";
	
	public function new(TileWidth:Int, TileHeight:Int, TextureForTileSheet:Texture) 
	{	
		arrTileList = [];
		arrAnimationSceneList = [];
		TileTargetWidth = TileWidth;
		TileTargetHeight = TileHeight;
		TileSheetTexture = TextureForTileSheet;
		TileTexture = System.createTexture(TileTargetWidth, TileTargetHeight);
		super(TileTexture);
		initialSetup();
	}
	
	private function initialSetup():Void
	{
		computeGridB();
		intCellsPerWidth = Std.int(TileSheetTexture.width / TileTargetWidth);
		intCellsPerheight = Std.int(TileSheetTexture.height / TileTargetHeight);
		//TileTexture.graphics.drawSubImage(TileSheetTexture, 0, 0, arrTileList[0].x*TileTargetWidth, arrTileList[0].y*TileTargetHeight, TileTargetWidth, TileTargetHeight);
	
	}
	
	public function addScene(name:String, sceneArray:Array<Int>, delayTim:Float, toRepeat:Bool)
	{
		arrAnimationSceneList.push(new AnimationFrames(name, sceneArray, delayTim, toRepeat));
	}
	
	public function playScene(name:String):Void
	{	
		if (isSceneNameInList(name)&&name!=strCurrentPlaying)
		{
			strCurrentPlaying = name;
			var anfrCurrentScene:AnimationFrames = getSceneByName(name);
			
			if (this.owner.has(Script) == false)
			{
				this.owner.add(new Script());
			}else this.owner.get(Script).stopAll();
			
			trace("adding animation script: "+name);
			if (anfrCurrentScene.boolRepeat)
			{
					anfrCurrentScene.intCurrentPanel = 0;
					this.owner.get(Script).run(new Repeat(new Sequence([
					new Delay(anfrCurrentScene.fltDelay),
					new CallFunction(function () {
						switchTileDisplay(anfrCurrentScene.arrAnimationTiles[anfrCurrentScene.intCurrentPanel]);
						anfrCurrentScene.intCurrentPanel++;
						if (anfrCurrentScene.intCurrentPanel > anfrCurrentScene.intMaxPanelNumber)
						{
							anfrCurrentScene.intCurrentPanel = 0;
						}
						})
					])));
				
			}else
				{
					anfrCurrentScene.intCurrentPanel = 0;
					this.owner.get(Script).run(new Repeat(new Sequence([
					new Delay(anfrCurrentScene.fltDelay),
					new CallFunction(function () {
						switchTileDisplay(anfrCurrentScene.arrAnimationTiles[anfrCurrentScene.intCurrentPanel]);
						anfrCurrentScene.intCurrentPanel++;
						if (anfrCurrentScene.intCurrentPanel > anfrCurrentScene.intMaxPanelNumber)
						{
							this.owner.get(Script).stopAll();
						}
						})
					])));
				}
			
			
		}
		
	}
	
	public function testScript():Void
	{
		if (this.owner.has(Script) == false)
		{
			this.owner.add(new Script());
		}
		
		this.owner.get(Script).run(new Repeat(new Sequence([
			new Delay(0.5),
			new CallFunction(function () {
				trace("testing");
				})
		])));
		
	}
	
	private function getSceneByName(name:String):AnimationFrames
	{
		for (scene in arrAnimationSceneList)
		{
			if (scene.strAnimationName == name)
			{
				return scene;
			}
		}
		return null;
	}
	
	private function isSceneNameInList(name:String):Bool
	{
		for (anim in arrAnimationSceneList)
		{
			if (anim.strAnimationName == name)
			{
				return true;
			}
		}
		return false;
	}
	
	public function switchTileDisplay(value:Int):Void
	{
		TileTexture.graphics.drawSubImage(TileSheetTexture, 0, 0, arrTileList[value].x*TileTargetWidth, arrTileList[value].y*TileTargetHeight, TileTargetWidth, TileTargetHeight);
	}
	
	
	private function computeGridB():Void
	{
		var row = Std.int(TileSheetTexture.width / TileTargetWidth);
		var column = Std.int(TileSheetTexture.height / TileTargetHeight);
		
		for (y in 0...column)
		{
			for (x in 0...row)
			{
				arrTileList.push(new Point(x, y));
			}
		}
		
	}
	
	override public function onUpdate(dt:Float):Dynamic 
	{
		super.onUpdate(dt);
	}
	
}