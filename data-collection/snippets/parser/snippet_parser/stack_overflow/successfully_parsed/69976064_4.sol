

pragma solidity ^0.8.6;

interface KeeperCompatibleInterface {
    function checkUpkeep(bytes calldata checkData) external returns (bool upkeepNeeded, bytes memory performData);
    function performUpkeep(bytes calldata performData) external;
}

contract Counter is KeeperCompatibleInterface {
    
    uint256 public counter;    

    
    
    uint public immutable interval;
    uint public lastTimeStamp;  
    
    
    address public contractBAddress;
    
    
    constructor(uint updateInterval,address _contractBAddress) {
      interval = updateInterval;
      lastTimeStamp = block.timestamp;
      counter = 0;
      contractBAddress=_contractBAddress;
    }

    function checkUpkeep(bytes calldata checkData) external view override returns (bool upkeepNeeded, bytes memory performData) {
        upkeepNeeded = (block.timestamp - lastTimeStamp) > interval;
        performData = checkData;
    }

    
    
    function performUpkeep(bytes calldata) external override {
        lastTimeStamp = block.timestamp;
        counter = counter + 1;
        ContractB contractB = ContractB(contractBAddress);
        contractB.setTokenName(counter);
    }
    
}
