pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/VRFConsumerBase.sol";




 
contract RandomNumberConsumer is VRFConsumerBase {
    
    bytes32 internal keyHash;
    uint256 internal fee;
    
    uint256 public randomResult;
    
    
    constructor() 
        VRFConsumerBase(
            0x8C7382F9D8f56b33781fE506E897a4F1e2d17255, 
            0x326C977E6efc84E512bB9C30f76E30c160eD06FB  
        )
    {
        keyHash = 0x6e75b569a01ef56d18cab6a8e71e6600d6ce853834d4a5748b720d06f878b3a4;
        fee = 0.0001 * 10 ** 18; 
    }
    
    
    function getRandomNumber() public returns (bytes32 requestId){
        require(LINK.balanceOf(address(this)) >= fee, "Not enough LINK - fill contract with faucet");
        return requestRandomness(keyHash, fee);
    }
    
    function fulfillRandomness(bytes32 requestId, uint256 randomness) internal override {
        randomResult = randomness;
    }


    
}
