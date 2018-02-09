package weltreich.core.genetic;

import weltreich.core.genetic.*;

interface Population {
    public function getCurrent():Chromosome;
    public function evaluateCurrent(f:Float):Void;
    public function naturalSelection():Void;
    public function reproduction():Void;
}