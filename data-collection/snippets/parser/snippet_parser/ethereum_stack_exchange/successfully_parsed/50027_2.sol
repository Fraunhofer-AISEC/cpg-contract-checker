

pragma solidity >=0.7.0 <0.9.0;

contract Storage {

    uint number; 

    function store(uint num) public returns (uint) {
        number = num;
        
        return num;         }

    
   

    function retrieve() public view returns (uint){ 
        return number;
    }

    
    function retrieve2() public returns (uint){ 
        return number;
    }
}
