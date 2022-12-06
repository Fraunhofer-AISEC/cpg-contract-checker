pragma solidity ^0.4.23;

contract Registry {
  mapping (bytes32 => address) public libraries;
  mapping (bytes32 => address) public contracts;

    function addLibrary(bytes32 _name, address _lib) external {
    require(libraries[_name] == address(0), "LIBRARY_ALREADY_EXISTS");
    require(_lib != address(0), "INSERT_VALID_LIBRARY_ADDRESS");
    libraries[_name] = _lib;
  }

  function addContract(bytes32 _name, address _contract) external {
    Enabled(_contract).setCMCAddress(address(this));
    contracts[_name] = _contract;
  }
}

interface ContractProvider {
    function libraries(bytes32 _name) external view returns (address);
    function contracts(bytes32 _name) external view returns (address);
}

contract Enabled {
  address public CMC;
  function setCMCAddress(address _CMC) external {
    if (CMC != 0x0 && msg.sender != CMC) {
        revert();
    } else {
        CMC = _CMC;
    }
  }
}

contract setXproxy is Enabled {
  function () payable public {
    address _impl =  ContractProvider(CMC).libraries('setXlib');
    require(_impl != address(0));
    assembly {
      let ptr := mload(0x40)
      calldatacopy(ptr, 0, calldatasize)
      let result := delegatecall(gas, _impl, ptr, calldatasize, 0, 0)
      let size := returndatasize
      returndatacopy(ptr, 0, size)
      switch result
      case 0 { revert(ptr, size) }
      default { return(ptr, size) }
    }
  }
}

library setXinterface {
    struct X {
        uint x;
    }

    function setX(X storage _X, uint _x) external;
}

library setXlib {
    function setX(setXinterface.X storage _X, uint _x) external {
        _X.x = _x;
    }
}

contract setXstorage is Enabled {
    using setXinterface for setXinterface.X;
    setXinterface.X X;
    function setX(uint _x) external {
        X.setX(_x);
    }

    function getX() external view returns (uint) {
      return X.x;
    }
}
