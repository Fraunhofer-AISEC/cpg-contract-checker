
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract Trivia is Ownable {

  IERC20 public WETHContract;
  uint256 playingFee = 440000000000000; 
  
  constructor(IERC20 _LinkContract) public payable {
      WETHContract = _WETHContract;
  }

  receive() external payable {
      
  }

  function payToPlay() public payable {
      require(WETHContract.transferFrom(
            msg.sender,
            address(this),
            playingFee 
        ),
        "You do not have enough WETH To Pay"
      );

      
      


  }

}