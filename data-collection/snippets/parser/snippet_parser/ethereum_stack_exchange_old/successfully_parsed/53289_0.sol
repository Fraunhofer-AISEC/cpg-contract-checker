pragma solidity ^0.4.21;
contract Test1 {
    function add(int a, int b) returns(string){  
    return "Qmrwokdkeoiudkeooiskelpdislpeosj;sd[opek;s[pkfe,;soeipsoekf;sodfpsoe,mfoskfesktgfetg";
}
}
contract Test2 {
Test1 test1;

function Test2(){  
    test1 = new Test1();  
}

function test(string a, string b) constant returns (string c){
    address addr = address(test1);  
     bytes4 sig = bytes4(sha3("add(int256,int256)")); 

   assembly {
    let x := mload(0x40)   
    mstore(x,sig) 
    mstore(add(x,0x04),a) 
    mstore(add(x,0x24),b) 

    let success := call(      
                        5000, 
                        addr, 
                        0,    
                        x,    
                        0x44, 
                        x,    
                        0x20) 

    c := mload(x) 
    mstore(0x40,add(x,0x44)) 
}
 }
}
