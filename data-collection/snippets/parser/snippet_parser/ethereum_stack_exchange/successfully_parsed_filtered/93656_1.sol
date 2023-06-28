
pragma solidity 0.6.6;

import "https://raw.githubusercontent.com/smartcontractkit/chainlink/master/evm-contracts/src/v0.6/VRFConsumerBase.sol"; 

contract RandomNumberConsumer is VRFConsumerBase {
    
    bytes32 internal keyHash;
    uint256 internal fee;
    
    uint256 internal randomResult;
    
    event RequestRandomness(
        bytes32 indexed requestId,
        bytes32 keyHash,
        uint256 seed
    );

    event RequestRandomnessFulfilled(
        bytes32 indexed requestId,
        uint256 randomness
    );
    
    
    constructor() 
        VRFConsumerBase(
            0xdD3782915140c8f3b190B5D67eAc6dc5760C46E9, 
            0xa36085F69e2889c224210F603D836748e7dC0088  
        ) public
    {
        keyHash = 0x6c3699283bda56ad74f6b855546325b68d482e983852a7a82979cc4807b641f4;
        fee = 0.1 * 10 ** 18; 
    }
    
    
    function getRandomNumber(uint256 userProvidedSeed) internal returns (bytes32 requestId) {
        require(LINK.balanceOf(address(this)) >= fee, "Not enough LINK - fill contract with faucet");
        uint256 seed = uint256(keccak256(abi.encode(userProvidedSeed, blockhash(block.number)))); 
        bytes32 _requestId = requestRandomness(keyHash, fee, seed);
        emit RequestRandomness(_requestId, keyHash, seed);
        return _requestId;
    }

    
    function fulfillRandomness(bytes32 requestId, uint256 randomness) internal override {
        emit RequestRandomnessFulfilled(requestId, randomness);
        randomResult = randomness;
    }
}
