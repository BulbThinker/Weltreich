package weltreich.core.genetic;

interface Chromosome {

    public function mutate():Void;
    public function cross(other:Chromosome):Chromosome;
    public function setFitness(f:Float);
    public function getFitness():Float;

}