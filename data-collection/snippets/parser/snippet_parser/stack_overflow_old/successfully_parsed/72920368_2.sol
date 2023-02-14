

pragma solidity ^0.8.15;

contract SimpleStorage1{

}

contract StorageFactory{
    
    struct ownerAndThereContracts {
        string name;
        address nf;

    }
    ownerAndThereContracts[] public saveYourContracts;
    SimpleStorage1[] public x;
    
    uint256 counter;
    function createNewContracts() public {
        SimpleStorage1 simpleStorage = new SimpleStorage1();  
        x.push(simpleStorage);
        
    }
        
        function refering(string memory _name) public {
            counter++;
        SimpleStorage1 simpleStorage2 = SimpleStorage1(x[counter]);
        address  simpleStorage2Address = address(simpleStorage2); 
        address payable _finalCast = payable(simpleStorage2Address); 
        saveYourContracts.push(ownerAndThereContracts(_name, _finalCast));

    }
}