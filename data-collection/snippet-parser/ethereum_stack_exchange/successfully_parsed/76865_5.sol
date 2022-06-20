contract TestProxy {
    
    bytes32 private constant IMPL_ADDRESS_KEY = keccak256("Implementation address key");

    constructor(address _lc) public {
        setTargetAddress(_lc);
    }

    function setTargetAddress(address _address) public {
        require(_address != address(0));
        
        bytes32 implAddressStorageKey = IMPL_ADDRESS_KEY;
        address a = _address; 
        
        assembly {
            sstore(implAddressStorageKey, a)
        }
    }
}