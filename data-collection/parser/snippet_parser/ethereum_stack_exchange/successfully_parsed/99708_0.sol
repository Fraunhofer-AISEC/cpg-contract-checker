   pragma solidity ^0.4.0;

contract SimpleStorage {
    unit storedData;
    
    
    function set(unit x) public {
         storedData = x;
    }
    
    function get() constant public returns (unit) { 
         return storedData;
    }
    
    function increment (unit n) public {
        storedData = storedData + n;
        return;
    }
}