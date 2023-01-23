pragma solidity ^0.4.22;
contract sample {
function buy(uint amount) payable {
  if (amount > 12)
     revert('Not enough value');
  }
}
