
contract AnimalContract{

    StorageLib.StorageStruct storage;

    function roar() public{
        LionLib.roar(storage);
    }

    function meow(uint256 someValue) public{
       CatLib.meow(storage, someValue);
    }  
}


function roar(StorageLib.StorageStruct storage storageStruct) public{
    storageStruct.hasRoared = true;
}
