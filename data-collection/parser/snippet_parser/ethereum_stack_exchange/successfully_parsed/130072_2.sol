      function nowItWorks() external view returns (bytes memory) {
        assembly {
            let res := 0x00              
            mstore(res, 0x20)            
            mstore(add(res, 0x20), 0x40) 
            mstore(add(res, 0x40), 1)    
            mstore(add(res, 0x60), 2)    
            return (res, 0x80)           
        }
    }
