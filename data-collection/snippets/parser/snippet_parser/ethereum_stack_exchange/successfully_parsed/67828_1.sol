pragma solidity ^0.4.24;

contract TestAssemblyAndRevert {
    function test(address from, address to, uint256 value) public {
        
        address token = 0xedc2d4aca4f9b6a23904fbb0e513ea0668737643;

        
        assembly {
            let ptr := mload(0x40)

            
            mstore(ptr, 0x23b872dd00000000000000000000000000000000000000000000000000000000)

            
            
            calldatacopy(add(ptr, 4), 4, 96)

            
            let result := call(gas, token, 0, ptr, 100, ptr, 32)

            if eq(result, 1) {
                return(0, 0)
            }
        }

        revert("TOKEN_TRANSFER_FROM_ERROR");
    }
}
