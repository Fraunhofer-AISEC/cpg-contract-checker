pragma solidity 0.8.12;

contract StorageA {
  uint public val = 1;
  event Test(string class,  address sender);
  constructor()  { }

  function setValue(uint v, address storageB, address storageC) external {
      emit Test("Contract Storage A", msg.sender);
        (bool success, bytes memory result) = storageB.delegatecall(abi.encodeWithSignature("setValue(uint256,address)", v, storageC));
        require(success == true);
  }
}

contract StorageB {
  uint public val = 2;
  event Test(string class,  address sender);
  constructor()  { }

  function setValue(uint v, address storageC) external { 
    emit Test("Contract Storage B", msg.sender);
    storageC.call(abi.encodeWithSignature("setValue(uint256)", v));
    val = v + 9;
  }
}

contract StorageC {
  uint public val = 3;
  event Test(string class,  address sender);
  constructor()  { }
  function setValue(uint v) external {
    emit Test("Contract Storage C", msg.sender);
    val = v + 7;
  }
}
