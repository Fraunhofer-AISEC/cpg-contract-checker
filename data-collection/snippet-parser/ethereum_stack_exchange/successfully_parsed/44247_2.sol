pragma solidity ^0.4.19;

contract ParentContract {
  ChildContract _contract;

  function createChildContract(address owner) public {
    _contract = new ChildContract(owner);
  }

  function getContractAddress() public constant returns (address) {
    return address(_contract);
  }
}

contract ChildContract {
  address _owner;

  function ChildContract(address owner) public {
    _owner = owner;
  }

  function getOwner() public constant returns (address) {
    return _owner;
  }
}
