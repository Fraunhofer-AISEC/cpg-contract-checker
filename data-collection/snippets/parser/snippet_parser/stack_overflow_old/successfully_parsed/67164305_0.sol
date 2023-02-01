pragma solidity 0.6.6;

import "https://raw.githubusercontent.com/smartcontractkit/chainlink/master/evm-contracts/src/v0.6/VRFConsumerBase.sol";

contract RandomNumberConsumer is VRFConsumerBase {
    
    bytes32 internal keyHash;
    uint256 internal fee;
    uint256 public randomResult;
    
    constructor() VRFConsumerBase(
            0xdD3782915140c8f3b190B5D67eAc6dc5760C46E9, 
            0xa36085F69e2889c224210F603D836748e7dC0088  
        ) public
    {
        keyHash = 0x6c3699283bda56ad74f6b855546325b68d482e983852a7a82979cc4807b641f4;
        fee = 0.1 * 10 ** 18; 
    }
    

    function getRandomNumber(uint256 userProvidedSeed) public returns (bytes32 requestId) {
        return requestRandomness(keyHash, fee, userProvidedSeed);
    }

    function fulfillRandomness(bytes32 requestId, uint256 randomness) internal override {
        randomResult = randomness.mod(50).add(1);
    }
    
    function getDraw(uint256 userProvidedSeed) public returns(uint256[] memory) {
         uint256[] memory draw = new uint256[](5);
         
         for(uint i = 0; i < 5; i++) {
             draw[i] = getRandomNumber(userProvidedSeed);
         }
         return draw;
    }
}
