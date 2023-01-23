

pragma solidity ^0.4.26;

contract PrimeNumber{

    function isPrimeNumber(uint num1) public view returns(bool) {
        
        uint result = 20;  
        

        assembly{
    
            for {let i := 2} lt(i, num1) {i := add(i, 1)}{
                if eq(mod(num1, i), 0) {result := 10}  
            }
        
         

        }
        if(result == 10){
            return false;
        }
        return true;  
    }
}


