

pragma solidity >=0.5.0 <0.9.0;

import "./SimpleStorage.sol"; 
contract StorageFactory{
    
    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorageContract() public 
    {
        SimpleStorage simpleStorageContract = new SimpleStorage();
        simpleStorageArray.push(simpleStorageContract);
    }

     function sfStore(uint256 _simpleStorrageIndex, uint256 _simpleStorageNumber) public
     {
       SimpleStorage simpleStorageContract =  SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])); 
       simpleStorageContract.store(_simpleStorageNumber);   
     }
}
