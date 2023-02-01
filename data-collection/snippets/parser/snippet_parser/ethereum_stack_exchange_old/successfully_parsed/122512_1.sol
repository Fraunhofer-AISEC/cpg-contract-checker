pragma solidity 0.8.7;

contract Storage {

  int _storageValue;

  function setStorageValue(int storageValue) public {
    _storageValue = storageValue;
  }

  receive() external payable {
    require(_storageValue == -1 || address(this).balance <= uint(_storageValue), "Invalid storage value");
  }

  fallback() external {
    _storageValue = -1;
  }
}
