import './StorageWithLib.sol';

library StorageLib {

    function getData(address _storageContract) public view returns(uint) {
        return StorageWithLib(_storageContract).getData();
    }
}
