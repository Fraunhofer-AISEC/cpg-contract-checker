pragma solidity 0.6.6;

import "@chainlink/contracts/src/v0.6/VRFConsumerBase.sol";

contract Sample is VRFConsumerBase {
    
    address private owner;
    
    bytes32 internal keyHash;
    uint256 internal fee;
    
    constructor(address _owner)
        VRFConsumerBase(
            0xa555fC018435bef5A13C6c6870a9d4C11DEC329C, 
            0x84b9B910527Ad5C03A9Ca831909E21e236EA7b06  
        ) public
    {
        keyHash = 0xcaf3c3727e033261d383b315559476f48034c13b18f8cafed4d871abe5049186;
        fee = 0.1 * 10 ** 18; 
        
        owner = _owner;
    }

    ...
