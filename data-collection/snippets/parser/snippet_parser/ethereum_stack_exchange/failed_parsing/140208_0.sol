contract Proxy {
      
        bytes32 public constant IMPLEMENTATION_SLOT = bytes32(          
            uint(keccak256("eip1967.proxy.implementation")) - 1 
        ); 
        
        bytes32 public constant ADMIN_SLOT = bytes32(                   
            uint(keccak256("eip1967.proxy.admin")) - 1 
        ); 
        );

}

library StorageSlot {

    struct AddressSlot {
        address value;
    } 

    function getAddressSlot(bytes32 slot) internal pure returns (AddressSlot storage r) {
        assembly {
            r.slot := slot
        } 
    }
}
