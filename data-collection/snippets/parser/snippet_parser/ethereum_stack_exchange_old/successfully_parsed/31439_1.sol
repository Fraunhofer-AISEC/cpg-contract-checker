pragma solidity ^0.4.11;

import "./BaseRegistry.sol";
import "../token/Token.sol";
import "../node/Node.sol";


contract ChildRegistryDelegate is BaseRegistry {

address public owner;
address public nodeDelegateAddress;
address[] public registeredNodes;

address public delegateContract;
address[] public previousDelegates;
uint256 public count;
address public tokenAddress;

  function ChildRegistryDelegate() {
    
  }


  function registerNode() {

    count += 1;

    Token existingToken = Token(tokenAddress);
    token.burn(1,msg.sender);
    register(msg.sender, "string");      
  

    createNodeContract();
  }

  function createNodeContract () {

    Node newNode = new Node();
    newNode.changeDelegate(nodeDelegateAddress);
    newNode.setOwner(msg.sender);
    newNode.setTokenAddress(tokenAddress);
    registeredNodes.push(newNode);

    

    registeredNodes.push(newNode);
  }

  function getNodes() constant returns (address[]) {
    return registeredNodes;
  }

  function setTokenAddress(address _tokenAddress) {
    tokenAddress = _tokenAddress;
  }

  function setNodeDelegateAddress(address _nodeDelegateAddress) {
    assert(owner == msg.sender);
    nodeDelegateAddress = _nodeDelegateAddress;
  }

}
