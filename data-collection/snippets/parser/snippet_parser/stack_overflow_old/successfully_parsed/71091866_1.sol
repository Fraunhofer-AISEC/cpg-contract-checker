pragma solidity ^0.8.2;
import "./IAnotherContract.sol";

contract AnotherContract is IAnotherContract {
  function doSomethingIfBalanceIsEnough()
    external
    returns (string memory)
  {
    
  }
}
