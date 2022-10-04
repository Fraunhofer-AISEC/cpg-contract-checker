pragma solidity >= 0.7.0 < 0.9.0;
contract Learningloop {
    
    uint [] public numberslist = [1,2,3,4,5,6,7,8,9,10]; 
    
    function getCount(uint _number) public view returns(uint){
        uint Rcount = 0; 
        
        
        
        
       for(uint i=1; i < numberslist.lenght; i++) {
           if (CheckModIsZero(numberslist[i], _number)){
             Rcount ++;   
           }
       }
       return Rcount;  
    }
    
    function CheckModIsZero( uint _num, uint _nums) public view returns (bool){
       if (_num % _nums == 0) {
           return true; 
       } else {
           return false; 
       }
    }
}
