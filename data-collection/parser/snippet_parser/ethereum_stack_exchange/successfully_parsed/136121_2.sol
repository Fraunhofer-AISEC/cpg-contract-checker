
pragma solidity ^0.8.16;

contract Contract {

    function callbackFunction(bytes memory data) public pure returns (bytes memory) {
    
        return data;
    }

    function callbackFunction2(bytes memory data) public view returns (bytes memory) {
    
        return data;
    }

    function doSomething(bytes memory data) public returns (bytes memory) {
        
        counter++;
        return data;
    }

}

