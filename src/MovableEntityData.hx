package ;
import flambe.Component;

/**
 * ...
 * @author Vrian Candelaria
 */

class MovableEntityData extends Component
{
	public var floatMyWidth:Float=0;
	public var floatMyHeight:Float=0;

	public function new(wid:Float, Hei:Float) 
	{
		floatMyWidth = wid;
		floatMyHeight = Hei;
	}
	
}