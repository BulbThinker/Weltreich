package weltreich.tictactoe.ia;

//RNA imports
import weltreich.core.ia.rna.RNA;
import weltreich.core.ia.rna.SigNeuron;
//Genetic Algorithm imports
import weltreich.core.genetic.Chromosome;

class SpielerTTT implements RNA {

    private layers:Array<Array<SigNeuron>>;

    public function new() {
        //
    }

    public function think(input:Array<Float>):Array<Float> {
        var output:Array<Float> = [];
        //<TODO> Error treatment
        for (l in this.layers) {
            for (n in l) {
                output.push(n.think(input));
            }
            input = output;
            output = [];
        }

        return(input);
    }

}