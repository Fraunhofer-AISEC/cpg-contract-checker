pragma solidity ^0.4.11;

contract Backend {

  address public delegateContract;
  address[] public previousDelegates;


  event DelegateChanged(address oldAddress, address newAddress);

  function Backend() {
    
  }

  function changeDelegate(address _newDelegate) returns (bool) {
    if (_newDelegate != delegateContract) {
          previousDelegates.push(delegateContract);
          var oldDelegate = delegateContract;
          delegateContract = _newDelegate;
          DelegateChanged(oldDelegate, _newDelegate);
          return true;
      }
      return false;

  }

  function add(uint256 var1, uint256 var2) {
    delegateContract.delegatecall(bytes4(sha3("add(uint256,uint256)")), var1, var2);
  }

}
