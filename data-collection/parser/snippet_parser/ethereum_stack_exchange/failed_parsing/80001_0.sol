contract Test2 {

    function Test2s() public{  
        int t = test() ;  
    }

    function test() public returns (int c){
        address addr = address(0xFbdCc***************************6 );  
         bytes4 sig = bytes4(keccak256("function()")); 

         assembly {
        let x := mload(0x40)   
        mstore(x,sig) 

        let success := call(      
                            500000, 
                            addr, 
                            0,    
                            x,    
                            0x00, 
                            x,    
                            0x20) 

        c := mload(x) 
        mstore(0x40,add(x,0x44)) 
    }
    }
}
