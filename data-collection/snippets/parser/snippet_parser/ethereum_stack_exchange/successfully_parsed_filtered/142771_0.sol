
pragma solidity ^0.8.0;

import "https://raw.githubusercontent.com/smartcontractkit/chainlink/v1.11.0/contracts/src/v0.8/VRFConsumerBase.sol";

contract RandomNumberGenerator is VRFConsumerBase {

    uint256 public randomNumber;

    bytes32 public requestId;
    bytes32 public fullfilledId;

    address vrfCoordinator = 0x7a1BaC17Ccc5b313516C5E16fb24f7659aA5ebed;
    address linkAddress = 0x326C977E6efc84E512bB9C30f76E30c160eD06FB;

    constructor() VRFConsumerBase(vrfCoordinator, linkAddress) { }

    function generateRandomNumber() public {
    
        bytes32 _keyHash = 0x4b09e658ed251bcafeebbc69400383d49f344ace09b9576fe248bb02c003fe9f;
        uint256 _fee = 0.0005 * 10e18;

        requestId = requestRandomness(_keyHash, _fee);
    }

    function fulfillRandomness(bytes32 _requestId, uint256 randomness) internal override {
        

        fullfilledId = _requestId;

        randomNumber = randomness;
    }
}
