

pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/AutomationCompatible.sol";
import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";

contract WeatherConsumer is ChainlinkClient, AutomationCompatible {
    uint256 public rain;
    
    
    function checkUpkeep(bytes calldata )
        external
        view
        override
        returns (bool upkeepNeeded, bytes memory )
    {
        upkeepNeeded = rain > 4 MM;
        requestRainData(); 
    }

    function performUpkeep(bytes calldata ) external override {
        
        require(rain > 4 MM);
        payout();
    }
}

