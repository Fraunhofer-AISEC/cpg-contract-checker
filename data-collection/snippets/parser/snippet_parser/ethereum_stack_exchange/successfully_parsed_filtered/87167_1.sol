interface Interface {
  function getVariable() external view returns (uint256);
}

contract A {
  function callExternal(address externalContract) public view returns (uint256) {
    return Interface(externalContract).getVariable();
  }
}

contract B is Interface {
  uint256 public foo;
    
  function getVariable() override view external returns (uint256) {
    return foo;
  }
}


contract C is Interface {
  uint256 public bar;
    
  function getVariable() override view external returns (uint256) {
    return bar;
  }
}
