pragma solidity ^0.4.11;

import "./BaseRegistry.sol";
import "../token/Token.sol";
import "../node/Node.sol";


contract ChildRegistry is BaseRegistry {

address public owner;
address public nodeDelegateAddress;
address[] public registeredNodes;

address public delegateContract;
address[] public previousDelegates;
uint256 public count;
address public tokenAddress;

  event DelegateChanged(address oldAddress, address newAddress);

  function ChildRegistry() {
    
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

  function registerNode() {
    delegateContract.delegatecall(bytes4(sha3("registerNode()")));
  }

  function createNodeContract () {
    delegateContract.delegatecall(bytes4(sha3("createNodeContract()")));
  }

  function getNodes() constant returns (address[]) {
    return registeredNodes;
  }

  function setTokenAddress(address _tokenAddress) {
    delegateContract.delegatecall(bytes4(sha3("setTokenAddress(address)")), _tokenAddress);
  }
  function setNodeDelegateAddress(address _nodeDelegateAddress) {
    delegateContract.delegatecall(bytes4(sha3("setNodeDelegateAddress(address)")), _nodeDelegateAddress);
  }


}
