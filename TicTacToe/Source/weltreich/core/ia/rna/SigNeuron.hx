package weltreich.core.ia.rna;

class SigNeuron implements Neuron {

    private weights:Array<Float>;

    public function new(nInputs:UInt) {
        this.weights = [for(i in 0...nInputs) 1.0];
    }

    public function setWeights(weigths:Array<Float>):Void {
        this.weights = weigths.copy();
    }

    public function activation(input:Float):Float {
        return(1.0/(1.0 + Math.exp(-input)));
    }

    public function think(input:Array<Float>):Float {
        if (this.weights.length != input.length) {
            //<TODO> Raise exception
            return(-2.0);
        }

        var result:Float = 0.0;

        for (i in 0...input.length) {
            result += (this.weights[i] * input[i]);
        }

        return(this.activation(result));
    }
    
}