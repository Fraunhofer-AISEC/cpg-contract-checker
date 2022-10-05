pragma solidity ^0.4.4;


contract C {
    bytes1 b10 = 0x6c;
    bytes1 b11 = 0x69;

    function test1() constant returns (bytes1) {
        return b10 & b11; 

    }

    function test2() constant returns (bytes1) {
        return b10 | b11; 
         
         
        
    }

    function test3() constant returns (bytes1) {
        return ~b10;  
         
         
    }

    **function test4() constant returns (bytes1) {
        return b10 << 1;  
         
         
    }
    function test5() constant returns (bytes1) {
        return b10 >> 1;  
         
         
    }**

}
