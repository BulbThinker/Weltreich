package weltreich.tictactoe.ia;

//RNA imports
import weltreich.core.ia.rna.RNA;
import weltreich.core.ia.rna.SigNeuron;
//Genetic Algorithm imports
import weltreich.tictactoe.genetic.ChromosomeTTT;

class SpielerTTT implements RNA {

    private var layers:Array<Array<SigNeuron>>;

    public function new(chromosome:ChromosomeTTT) {
        this.layers = [];
        
        var neuronsW:Array<Array<Float>>;
        var neuron:SigNeuron;

        for (i in 0...4) {
            neuronsW = chromosome.getLayer(i);
            this.layers.push([]);
            for (n in neuronsW) {
                neuron = new SigNeuron(n.length);
                neuron.setWeights(n);
                this.layers[i].push(neuron);
            }
        }
    }

    public function think(input:Array<Float>):Array<Float> {
        var output:Array<Float> = [];
        
        if (this.layers[0][0].getNumInputs() != input.length) {
            //<TODO> Raise exception
            return([]);
        }
        
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