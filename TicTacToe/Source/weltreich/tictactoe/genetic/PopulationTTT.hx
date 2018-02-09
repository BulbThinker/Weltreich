package weltreich.tictactoe.genetic;

//Weltreich Core imports
import weltreich.core.genetic.Population;
import weltreich.core.genetic.Chromosome;
//Weltreich TicTacToe imports
import weltreich.tictactoe.genetic.ChromosomeTTT;

class PopulationTTT implements Population {

    private var individuals:Array<ChromosomeTTT>;
    private var current:UInt;

    private var mutateRate:Float;
    private var populationSize:UInt;
    private var numberOfKill:UInt;

    public function new(mutateRate:Float=0.1,populationSize:UInt=6,numberOfKill:UInt=2) {
        //<TODO> invalid parameters treatment
        this.mutateRate = mutateRate;
        this.populationSize = populationSize;
        this.numberOfKill = numberOfKill;

        this.individuals = [for(i in 0...this.populationSize) new ChromosomeTTT()];
        this.current = 0;
    }

    public function getCurrent():Chromosome {
        if (this.current < this.populationSize)
            return(cast this.individuals[this.current]);
        else {
            //<TODO> Raise exception
        }
        return(null);
    }

    public function evaluateCurrent(f:Float):Void {
        if (this.current < this.populationSize) {
            this.individuals[this.current].setFitness(f);
            ++this.current;
        } else {
            //<TODO> Raise exception
        }
    }

    public function naturalSelection():Void {
        if (this.current == this.populationSize) {
            this.individuals.sort(this.reverseSortComp);
            //Kill the less fit
            for (i in 0...this.numberOfKill)
                this.individuals.pop();
        } else {
            //<TODO> Raise exception
        }
    }
    
    public function reproduction():Void {
        if (this.current == (this.populationSize+1)) {
            
            var chrom:ChromosomeTTT;

            for (i in 0...this.numberOfKill) {
                //<TODO> Improve selection method
                chrom = cast this.individuals[i].cross(this.individuals[i+1]);

                if (Math.random() < this.mutateRate)
                    chrom.mutate();
                
                this.individuals.push(chrom);
            }
            
            this.current = 0;
        } else {
            //<TODO> Raise exception
        }
    }


    private function reverseSortComp(x:Chromosome,y:Chromosome):Int {
        if (x.getFitness() > y.getFitness()) {
            return(-1);
        } else if (y.getFitness() > x.getFitness()) {
            return(1);
        }
        return(0);
    }
}