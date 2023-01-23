pragma solidity 0.8.7;

interface MyStorage {
    function setStorageValue(uint256) external;
}

contract StorageFactory {
  uint256 storageValue;

  constructor(uint256 _storageValue) {
    storage = _storageValue;
  }

  function initStorage(MyStorage store) public payable {
    store.setStorageValue(storageValue);
    address payable storeAddress = payable(address(store));
    storeAddress.call{value: msg.value}("");
  }
}
