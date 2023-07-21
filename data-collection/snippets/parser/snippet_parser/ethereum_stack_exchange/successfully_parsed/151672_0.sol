
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/VRFConsumerBase.sol";

contract RandomNumberConsumer is VRFConsumerBase {
    event RequestFulfilled(bytes32 requestId, uint256 randomness);

    bytes32 internal keyHash;
    uint256 internal fee;
    uint256 public randomResult;

    constructor()
        VRFConsumerBase(
            0x7a1BaC17Ccc5b313516C5E16fb24f7659aA5ebed, 
            0x326C977E6efc84E512bB9C30f76E30c160eD06FB 
        )
    {
        keyHash = 0x4b09e658ed251bcafeebbc69400383d49f344ace09b9576fe248bb02c003fe9f;
        fee = 0.1 * 10 ** 18; 
    }

    
    function getRandomNumber() public returns (bytes32 requestId) {
        require(
            LINK.balanceOf(address(this)) >= fee,
            "Not enough LINK - fill contract with faucet"
        );
        return requestRandomness(keyHash, fee);
    }

    
    function fulfillRandomness(
        bytes32 requestId,
        uint256 randomness
    ) internal override {
        randomResult = randomness;
        emit RequestFulfilled(requestId, randomness);
    }

}
