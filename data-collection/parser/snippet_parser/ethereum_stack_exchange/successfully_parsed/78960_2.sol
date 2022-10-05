pragma solidity ^0.5.0;

import "./LandRegistry.sol";

contract Factory {
    
    event DeployedBytes(bytes ContractBytes);

    function Registration( 
        string memory _state
    ) public returns( LandRegistry ) { 
        LandRegistry registry = new LandRegistry(_state);
        bytes memory b = at(address(registry));
        emit DeployedBytes(b);
    }

    function at(address _addr) private view returns (bytes memory o_code) {
        assembly {
            
            let size := extcodesize(_addr)
            
            
            o_code := mload(0x40)
            
            mstore(0x40, add(o_code, and(add(add(size, 0x20), 0x1f), not(0x1f))))
            
            mstore(o_code, size)
            
            extcodecopy(_addr, add(o_code, 0x20), 0, size)
        }
    }
}
