package ;
import flambe.Component;

/**
 * ...
 * @author Vrian Candelaria
 */

class LootBag extends Component
{
	public var boolHasLoot:Bool = false;

	public function new() 
	{
		
	}
	
	public function gotLoot():Dynamic
	{
		boolHasLoot = true;
	}
	
	public function dropLoot():Dynamic
	{
		boolHasLoot = false;
	}
	
}