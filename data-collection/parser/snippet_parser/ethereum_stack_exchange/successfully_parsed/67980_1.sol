pragma solidity 0.4.18;


contract TestAddress {

    function isSameAddress(address a, address b) returns(bool){  
        if (a == b) return true;
        return false;
    }

    function() public {  
        revert();
    }
}

contract TestAllignment {
    TestAddress test;

    function TestAllignment(){  
        test = new TestAddress();
    }

    function testAsem() public view returns (bool same) {
        address contractAddr = address(test);  
        bytes4 sig = bytes4(keccak256("isSameAddress(address,address)")); 
        address a = msg.sender;

        assembly {
            let x := mload(0x40)   
            mstore(x,sig) 
            mstore(add(x,0x04),a) 
            mstore(add(x,0x24),a) 
            mstore(0x40,add(x,0x64)) 
             

            let success := call(      
                            5000, 
                            contractAddr, 
                            0,    
                            x,    
                            0x44, 
                            x,    
                            0x20) 

            same := mload(x)       
            mstore(0x40,add(x,0x20)) 
        }

        return same;
    }

    function testSol() public view returns(bool same){ 
        address add = msg.sender;

        same = test.isSameAddress(add,add); 
    }
}
