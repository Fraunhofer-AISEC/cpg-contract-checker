

pragma solidity ^0.8.0;
    
contract Example {
    struct DummyStruct {
        uint256 something;
    }

    DummyStruct[1] public dummyStructArray;


    
    
    function modifiesInMemory() public {
        DummyStruct memory memoryCopy = dummyStructArray[0];
        memoryCopy.something = 10;

        
        dummyStructArray[0] = memoryCopy;
    }

    
    
    function modifiedInLocalStorage() public {
         DummyStruct storage localStorageReference = dummyStructArray[0];
         localStorageReference.something = 10;
    }

    
    function modifiesInState() public {
        
        dummyStructArray[0].something = 10;
    }
}
