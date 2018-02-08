package weltreich.core.ia.rna;

interface Neuron {

    public function think(input:Array<Float>):Float;
    public function setWeights(weigths:Array<Float>):Void;
    public function activation(input:Float):Float;
    public function getNumInputs():UInt;

}