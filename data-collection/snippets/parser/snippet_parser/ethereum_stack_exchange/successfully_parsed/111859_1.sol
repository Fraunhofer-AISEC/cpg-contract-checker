
pragma solidity 0.8.7;
pragma experimental ABIEncoderV2;

import "@chainlink/contracts/src/v0.8/VRFConsumerBase.sol";

contract Example is VRFConsumerBase {
 
  
  
  
  

  
  address __vrfCoordinatorAddress  = 0xb3dCcb4Cf7a26f6cf6B120Cf5A73875B7BBc655B;
  address __linkTokenAddress       = 0x01BE23585060835E02B77ef475b0Cc51aA1e0709;
  bytes32 __oracleKeyhash          = 0x2ed0feb3e7fd2022120aa84fab1945545a9f2ffc9076fd6156fa96eaff4c1311;
  
  uint256 fee;
  bytes32 keyHash;

  constructor() VRFConsumerBase(__vrfCoordinatorAddress, __linkTokenAddress) public {

      keyHash = __oracleKeyhash;

      fee = 0.1 * 10 ** 18; 
      
  }
  
  function getRandomNumber(uint256 userProvidedSeed) public returns (bytes32 requestId) {
      return requestRandomness(keyHash, fee);
  }
  
  function fulfillRandomness(bytes32 requestId, uint256 randomness) internal override {
    
    
  }
  
}
