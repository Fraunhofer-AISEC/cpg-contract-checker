
abstract contract RandomNumberConsumer is VRFConsumerBase {
    
    function editDna(uint randomN, uint carId, bytes32 requestId) internal virtual;

    constructor() VRFConsumerBase(..) public {
        ..
    }

    function fulfillRandomness(bytes32 requestId, uint256 randomness) internal override {
        .. 
        editDna(randomness, carId, requestId);
    }
}


contract MAIN is Ownable, RandomNumberConsumer {
    ..
    function editDna(uint randomN, uint carId, bytes32 requestId) internal override {
        ..
    }
}
