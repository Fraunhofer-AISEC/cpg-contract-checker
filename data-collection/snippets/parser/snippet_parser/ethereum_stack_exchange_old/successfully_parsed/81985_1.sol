pragma solidity 0.6.2;

contract Master {
    mapping(address => uint) public balances;
    address public implementation;

    function setBalance(address _address, uint _balance) public {
        balances[_address] = _balance;
    }

    function getBalance(address _balance) public view returns (uint) {
        return balances[_balance];
    }


}

contract Child {
    mapping(address => uint) public balances;
    address public implementation;

    function setImplementation(address _address) public {
        implementation = _address;
    }


    fallback () payable external {
        _fallback();
    }

    function _fallback() internal {
        _delegate(implementation);
    }


   function _delegate(address _implementation) internal {
    assembly {
      
      
      
      calldatacopy(0, 0, calldatasize())

      
      
      let result := delegatecall(gas(), _implementation, 0, calldatasize(), 0, 0)

      
      returndatacopy(0, 0, returndatasize())

      switch result
      
      case 0 { revert(0, returndatasize()) }
      default { return(0, returndatasize()) }
    }
  }

}
