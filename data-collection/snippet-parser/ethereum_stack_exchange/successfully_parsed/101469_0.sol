

pragma solidity 0.6.12;

import "@openzeppelin/contracts/math/SafeMath.sol";

contract MultiSend {
  using SafeMath for uint256;

  
  function divideSendCoin(address[] memory addresses) external {
    uint256 balance = address(this).balance;
    uint256 eachAmount = balance.mul(10 ** 10).div(addresses.length).div(10 ** 10);

    for (uint256 i = 0 ; i < addresses.length ; i++) {
      payable(addresses[i]).transfer(eachAmount);
    }
  }

  receive() payable external {}
}
