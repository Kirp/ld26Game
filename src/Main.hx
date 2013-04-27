package ;

import flambe.asset.AssetPack;
import flambe.asset.Manifest;
import flambe.System;

/**
 * ...
 * @author Vrian Candelaria
 */
class Main 
{

    private static function main () 
    {
        // Wind up all platform-specific stuff
        System.init();

        // Load up the compiled pack in the assets directory named "bootstrap"
        //var manifest = Manifest.build("bootstrap");
        var loader = System.loadAssetPack(Manifest.build("bootstrap"));
		
        loader.success.connect(function (pack) {
			AssetHolder.pack = pack;
			System.root.add(new GameAlphaStage());
		});
		
		loader.error.connect(function (message) {
			trace("Loading error: "+message);
		});
		
		loader.progressChanged.connect(function () {
			trace("Loading progress... "+loader.progress + " of "+loader.total);
		});
    }
}
