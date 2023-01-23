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
        saveYourContracts.push(ownerAndThereContracts(_name,simpleStorage2)); 

        }




    

}
