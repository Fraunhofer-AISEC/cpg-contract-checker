
pragma solidity 0.8.6;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";


interface KeeperCompatibleInterface {
    function checkUpkeep(bytes calldata checkData) external returns (bool upkeepNeeded, bytes memory performData);
    function performUpkeep(bytes calldata performData) external;
}

contract Counter is KeeperCompatibleInterface {
    
    AggregatorV3Interface internal priceFeed;

    uint public counter;    

    
    uint public immutable interval;
    uint public lastTimeStamp;
    
    constructor(uint updateInterval) {
      interval = updateInterval;
      lastTimeStamp = block.timestamp;
      counter = 0;
      priceFeed = AggregatorV3Interface(0x9326BFA02ADD2366b30bacB125260Af641031331);
    }
    
    function getLatestPrice() public view returns (int) {
        (
            uint80 roundID, 
            int price,
            uint startedAt,
            uint timeStamp,
            uint80 answeredInRound
        ) = priceFeed.latestRoundData();
        return price;
    }

    function checkUpkeep(bytes calldata checkData) external view override returns (bool upkeepNeeded, bytes memory performData) {
        upkeepNeeded = (block.timestamp - lastTimeStamp) > interval;
        performData = checkData;
    }

    function performUpkeep(bytes calldata performData) external override {
        lastTimeStamp = block.timestamp;
        counter = counter + 1;
        performData;
        getLatestPrice();
    }
}
