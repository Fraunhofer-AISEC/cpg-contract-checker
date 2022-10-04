

pragma solidity >0.4.22 <0.7.0;


contract WhileLoop {

    uint8 number=1;
   
    function retrieve() public returns (uint8){
        
        while(number != 4){
            number++;
        }
        
        return number;
    }
    
}
