import './StorageLib.sol';

contract ActionWithLib {
    using StorageLib for address;
    address public storageContract;

    function ActionWithLib(address _storageContract) public {
        storageContract = _storageContract;
    }

    function doSomething() public {
        uint data = storageContract.getData();
        
    }
}
