pragma solidity ^0.5.12;

import "./customer.sol";
contract BankA{
  function pay() public returns(uint256){
    require(address(this).balance>1000, "Balance Not Enough");
    customer client=new customer();
    address(client).transfer(1000);
    return address(client).balance;
  }
  function() external payable{}
}
