
pragma solidity ^0.8.0;

struct Wrapper {
    uint256 value;
}

library TestLibrary {

    function testLocalStorageParameter(Wrapper storage wrapper) public {
        
        
        wrapper.value = 10;
    }

    function testLocalStorageVariable(Wrapper storage wrapper) public {
        

        
        
        Wrapper storage secondWrapper = wrapper;

        
        secondWrapper.value = 20;
    }
}

contract TestContract{
    
    Wrapper wrapper; 

    function getValue() public view returns(uint256) {
        return wrapper.value;
    }

    function calltestLocalStorageParameter() public {
        
        TestLibrary.testLocalStorageParameter(wrapper);
    }

    function calltestLocalStorageVariable() public {
        
        TestLibrary.testLocalStorageVariable(wrapper);
    }
}
