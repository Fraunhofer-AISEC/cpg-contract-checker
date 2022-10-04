import './IStorage.sol';

contract ActionWithInterface {
    IStorage public storageContract;

    function ActionWithInterface(address _storageContract) public {
        storageContract = IStorage(_storageContract);
    }

    function doSomething() public {
        uint data = storageContract.getData();
        
    }   
}
