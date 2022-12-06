pragma solidity 0.6.2;

contract Store {

  uint counter;

  function callMe(bytes calldata test) external returns(bytes memory) {
     counter++;
     return abi.encode(test);
  }

  function viewCounter () public view returns(uint256) {
     return(counter);
  }

  function clearCounter() public  {
     counter = 0 ;
  }   
}
