

pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./IRandomNumberGenerator.sol";

contract Roulette is Ownable {

  using SafeERC20 for IERC20;

  IERC20 public gameToken;

  uint256[100] internal randomNumbers;

  IRandomNumberGenerator internal randomNumberGenerator;

  
  modifier onlyRandomGenerator() {
    require(msg.sender == address(randomNumberGenerator), "Only random generator");
    _;
  }

  constructor(address tokenAddress) {
    gameToken = IERC20(tokenAddress);
  }

  function setRandomNumberGenerator(address randomNumberGenerator) external onlyOwner {
    randomNumberGenerator = IRandomNumberGenerator(randomNumberGenerator);
  }

  function getRandomNumber() internal onlyOwner returns (uint) {
    uint result = randomNumbers[randomNumbers.length-1];
    delete randomNumbers[randomNumbers.length-1];

    return result;
  }

  function numberGenerated(uint randomNumber) external onlyRandomGenerator {
    randomNumbers = expand(randomNumber);
  }

  
  function expand(uint256 randomValue) public pure returns (uint256[] memory expandedValues) {
    expandedValues = new uint256[](100);
    for (uint256 i = 0; i < 100; i++) {
      expandedValues[i] = uint256(keccak256(abi.encode(randomValue, i)));
    }
    return expandedValues;

    
  }
}








pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/VRFConsumerBase.sol";
import "./IRoulette.sol";

contract RandomNumberGenerator is VRFConsumerBase {

  address public roulette;
  bytes32 internal keyHash;
  uint256 internal fee;
  uint256 internal randomResult;

  
  modifier onlyRoulette() {
    require(msg.sender == roulette, "Caller to function is not the roulette contract");
    _;
  }

  constructor(address _roulette) 
    VRFConsumerBase(
        0xa555fC018435bef5A13C6c6870a9d4C11DEC329C, 
        0x84b9B910527Ad5C03A9Ca831909E21e236EA7b06  
    )
  {
    keyHash = 0xcaf3c3727e033261d383b315559476f48034c13b18f8cafed4d871abe5049186;
    fee = 0.1 * 10 ** 18;
    
    roulette = _roulette;
  }
  
  function getRandomNumber() public onlyRoulette returns (bytes32 requestId) {
    require(LINK.balanceOf(address(this)) >= fee, "Not enough LINK - fill contract with faucet");
    return requestRandomness(keyHash, fee);
  }

  function fulfillRandomness(bytes32 requestId, uint256 randomness) internal override {
    randomResult = randomness;
    IRoulette(roulette).numberGenerated(randomResult);
  }
}
