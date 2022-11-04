pragma solidity ^0.6.6;

import "./ERCI20.sol";
import "./newERC20.sol";

   contract timeLock is ERCI20, newERC20 {

     address payable sender = msg.sender;
     address payable benificiary = 0x41194f140110F1D0C5DcE0e2Ef3fC385a38F319b;
     uint256 value = 5;
     uint256 releaseTime;

   function setReleaseTime(uint8 _days) external {
     releaseTime = now + _days * 1 days;
    }
   function release() public payable returns(uint256){
   
     require((msg.sender).balance > value, "Sender Amount Error");
     require(benificiary != address(0), "Benificiary Address Error");

     
       emit Transfer(sender, benificiary, value);
       return (msg.sender).balance;
   }

}
