import "@chainlink/contracts/src/v0.7/KeeperCompatible.sol";

contract Counter is KeeperCompatibleInterface {
    uint public counter;

    uint public immutable interval;
    uint public lastTimeStamp;

    constructor(uint updateInterval) {
    interval = updateInterval;
    lastTimeStamp = block.timestamp;

    counter = 0;
    }

    function checkUpkeep(bytes calldata ) external override returns (bool upkeepNeeded, bytes memory ) {
        upkeepNeeded = (block.timestamp - lastTimeStamp) > interval;
        
    }

    function performUpkeep(bytes calldata ) external override {
        lastTimeStamp = block.timestamp;
        counter = counter + 1;
        
    }
}
