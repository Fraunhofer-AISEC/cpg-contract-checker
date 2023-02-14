pragma solidity 0.4.11;

contract Contract1 
{
  uint public f1;
  uint public f2;
  
  function myfunction(uint param1,uint param2) external 
  {
      f1 = param1;
      f2 = param2;
  }
}

contract Contract2  
{
  Contract1 c = Contract1( <deployment_address_of_Contract1>);

  bool public success;

  function test_call3() public
  {
       success = address(c).call(  bytes4(keccak256("myfunction(uint256,uint256)")),  400, 500);
  }
}
