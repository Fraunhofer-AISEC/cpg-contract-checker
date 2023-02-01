    function nowItWorks() external view returns (bytes memory) {
        assembly {
            let res := mload(0x40)       
            mstore(res, 0x20)            
            mstore(add(res, 0x20), 0x40) 
            mstore(add(res, 0x40), 1)    
            mstore(add(res, 0x60), 2)    
            mstore(0x40, add(res, 0x80)) 
            return (res, 0x80)           
        }
    }
