contract Test1 {
    function add(int a, int b) returns(int){  
        return a+b;
    }
    function() returns (int){  
        return -1;
    }
}

contract Test2 {
    Test1 test1;

    function Test2(){  
        test1 = new Test1();  
    }

    function test(int a, int b) constant returns (int c){
        address addr = address(test1);  
         bytes4 sig = bytes4(sha3("add(int256,int256)")); 

        assembly {
            let x := mload(0x40)   
            mstore(x,sig) 
            mstore(add(x,0x04),a) 
            mstore(add(x,0x24),b) 

            call(5000, addr, 0, 
            x, 0x44, add(x,0x80), 0x20) 
            c := mload(add(x,0x80)) 
            mstore(0x40,add(x,0x100)) 
        }
    }

    function test2(int a, int b) constant returns(int c){ 
        return test1.add(a,b); 
    }
}
