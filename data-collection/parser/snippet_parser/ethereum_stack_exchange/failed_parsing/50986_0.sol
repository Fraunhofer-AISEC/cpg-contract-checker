Here is my program:-
pragma solidity ^0.4.18;  
contract C {  
bytes32 public temp;  
function hashingsha3 (uint s)   {  
temp= sha3(s);  
}

    function hashingsha256 (uint s) {
        temp= sha256(s); 
    }
     function kec (uint s)   returns  (bytes32 hash){
        temp= keccak256(s); 
    }

}
