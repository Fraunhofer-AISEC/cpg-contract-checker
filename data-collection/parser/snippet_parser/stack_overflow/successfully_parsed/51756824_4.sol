pragma solidity >0.4.23 <0.5.0;

contract Parent {
    int value;

    function setValue(int v) public {
        value = v;
    }

    function getValue() external view returns (int) {
        return value;
    }
}

contract Child {
    Parent parent;

    function setParent(address a) public {
        parent = Parent(a);
    }

    function getValue() external view returns (int value) {
        
        

        
        address addr = address(parent);
        bytes4 sig = bytes4(keccak256("getValue()"));

        assembly {
           let o := mload(0x40) 
           mstore(o,sig)        

           let success := call(
               15000,           
               addr,            
               0,               
               o,               
               0x04,            
               o,               
               0x20)            

           value := mload(o)
           mstore(0x40,add(o,0x04))
        }
    }
}
