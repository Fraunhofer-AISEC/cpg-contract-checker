pragma solidity ^0.6.6;

import "./newERC20Interface.sol";  

  contract timeLock2 {
      mapping(address => uint256) _balances;
      event Transfer(address, uint256);

      newERC20Interface token;
      address receiver = 0xAdB2cbbAb6764643ec15789F8428d5cD9510342b;
      uint256 amountToSend = 100;
      uint256 relaseTime = 1589180400;

      function releseToken() public {
          require(msg.sender == receiver);
          require(now >= relaseTime);

          msg.sender.transfer(amountToSend);
          emit Transfer(msg.sender, amountToSend);

      }
      function balanceOf(address account) public view returns(uint256){
         return _balances[account];
      }
  }
