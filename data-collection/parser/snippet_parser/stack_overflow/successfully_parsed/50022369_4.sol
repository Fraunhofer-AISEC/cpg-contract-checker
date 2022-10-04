import './IStorage.sol';

contract StorageWithInterface is IStorage {
    uint public data;

    function getData() public returns(uint) {
        return data;
    }
}
