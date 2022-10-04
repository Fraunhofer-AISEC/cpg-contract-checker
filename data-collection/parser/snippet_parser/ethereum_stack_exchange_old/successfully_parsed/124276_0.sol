
pragma solidity ^0.8.0;

interface KeeperCompatibleInterface {
    function checkUpkeep(bytes calldata checkData) external returns (bool upkeepNeeded, bytes memory performData);
    function performUpkeep(bytes calldata performData) external;
}

contract Huma is KeeperCompatibleInterface {

    event UpkeepChecked(uint256 timestamp);
    event UpkeepPerformed( uint counter );
    uint public counter;

    function checkUpkeep(bytes calldata checkData) external override returns (bool upkeepNeeded, bytes memory performData) {       
        upkeepNeeded = true;
        performData = checkData;
        emit UpkeepChecked(block.timestamp);
    }

    function performUpkeep(bytes calldata ) external override {
        counter++;
        emit UpkeepPerformed(counter);
    }
}
