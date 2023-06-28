pragma solidity ^0.7.4;

contract StackExchange {
    
    address _delegate;
    
    constructor (address delegate) {
        _delegate = delegate;
    }
    
    function getValue() public returns (uint256) {
        bytes memory data = abi.encodeWithSignature("modValue(uint256,uint256)", 52, 3);

        assembly {
            let pointer := mload(0x40)
            
            if iszero(delegatecall(not(0), sload(_delegate.slot), add(data,32), mload(data), pointer, 0x20)) {
                revert(0, 0)
            }

            let size := returndatasize()
            returndatacopy(pointer, 0, size)
            return(pointer,size)
        }
    }
}
