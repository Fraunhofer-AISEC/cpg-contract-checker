struct Dog{
            string dogName;
            uint256 foodReceived; 
            uint256 dogID;
        }
    
    mapping(uint256 => Dog) private mappingOfDogs;
    
    function giveFood(uint256 dogID) public {
            mappingOfDogs[dogID].foodReceived++;  
            
    
      
        }
