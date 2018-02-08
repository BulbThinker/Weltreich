package weltreich.tictactoe.genetic;

import weltreich.core.genetic.Chromosome;

class ChromosomeTTT implements Chromosome {

    private genes:Array<Float>;
    private fitness:Float;

    public function new(?genes) {
        if (genes == null)
            this.genes = [for(i in 0...44) Math.random()];
        else
            this.genes = genes.copy();
        this.fitness = 0.0;
    }

    public function mutate():Void {
        var selected:UInt = Math.floor((Math.random() * this.genes.lenght));
        this.genes[selected] = Math.random();
    }

    public function cross(other:Chromosome):Chromosome {
        var pivot:UInt = Math.floor(Math.random() * (this.genes.lenght-1)) + 1;
        var newGenes:Array<Float> = this.genes.splice(0,pivot).concat(other.splice(pivot,other.length));
        return(new ChromosomeTTT(pivot));
    }

    public function setFitness(f:Float) {
        this.fitness = f;
    }

    public function getFitness():Float {
        return(this.fitness);
    }

}