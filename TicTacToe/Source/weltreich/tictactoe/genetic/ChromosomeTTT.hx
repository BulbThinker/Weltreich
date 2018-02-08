package weltreich.tictactoe.genetic;

import weltreich.core.genetic.Chromosome;

class ChromosomeTTT implements Chromosome {

    private var genes:Array<Float>;
    private var fitness:Float;

    public function new(?genes:Array<Float>) {
        if (genes == null)
            this.genes = [for(i in 0...83) Math.random()];
        else
            this.genes = genes.copy();
        this.fitness = 0.0;
    }

    public function mutate():Void {
        var selected:UInt = Math.floor((Math.random() * this.genes.length));
        this.genes[selected] = Math.random();
    }

    public function cross(other:Chromosome):Chromosome {
        var pivot:UInt = Math.floor(Math.random() * (this.genes.length - 1)) + 1;
        var parent2:ChromosomeTTT = cast (other, ChromosomeTTT);
        var newGenes:Array<Float> = this.genes.slice(0,pivot).concat(parent2.genes.slice(pivot,parent2.genes.length));
        return(new ChromosomeTTT(newGenes));
    }

    public function setFitness(f:Float):Void {
        this.fitness = f;
    }

    public function getFitness():Float {
        return(this.fitness);
    }

    public function getLayer(layer:UInt = 0):Array<Array<Float>> {
        var output:Array<Array<Float>> = [];

        switch layer {
            case 0: for(i in 0...5) output.push(this.genes.slice(9*i,9*i + 9));
            case 1: for(i in 0...4) output.push(this.genes.slice(5*i + 45, 5*i + 50));
            case 2: for(i in 0...3) output.push(this.genes.slice(4*i + 65, 4*i + 69));
            case 3: for(i in 0...2) output.push(this.genes.slice(3*i + 77, 3*i + 80));
            default:
        }
           
        return(output);
    }

}