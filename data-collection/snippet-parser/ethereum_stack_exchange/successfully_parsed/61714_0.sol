    pragma solidity ^0.4.24;

    contract Back is Ownable {

      using SafeMath for uint;

      modifier affordPay() {
        require(msg.sender.balance > msg.value, "You don't have enough eth!!");
        _;
      }

      function back() external affordPay() payable {
        msg.sender.transfer(msg.value);
      }

    }
