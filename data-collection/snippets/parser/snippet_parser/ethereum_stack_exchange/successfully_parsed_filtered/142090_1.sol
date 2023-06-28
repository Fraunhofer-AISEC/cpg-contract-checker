pragma solidity ^0.8.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/Math.sol";
contract Test {
  uint256 percent = 10;
  function managePayment(uint256 payment) public view returns(uint256){
      return  Math.mulDiv(payment, percent, 100);
  }
}
