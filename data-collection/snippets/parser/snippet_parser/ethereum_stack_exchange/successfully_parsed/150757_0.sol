contract NodeContract {

    bytes latestModelWeights;

    function setWeights(bytes memory weights) public {
        latestModelWeights = weights;
    } 

    function getWeights() public returns (bytes memory) {
        return latestModelWeights;
    }

}
