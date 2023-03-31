

pragma solidity >=0.8.0;

import "./interface/IERC20.sol";
import "./lib/SafeTransfer.sol";

contract Mycontract {

    
    bytes4 internal constant TRANSFER = 0xa9059cbb;
    
    bytes4 internal constant PAIR_SWAP = 0x022c0d9f;

    
    receive() external payable {}

    fallback() external payable {
        assembly {

            let pair := shr(96, calldataload(0x00))
        
            let tokenAmountOut := calldataload(0x14)
            
            mstore(0x00, PAIR_SWAP)
            mstore(0x04, tokenAmountOut)
            mstore(0x24, 0)
            mstore(0x44, address())
            mstore(0x64, ???)  
            
            let s := call(sub(gas(), 5000), pair, 0, 0x00, ???, 0, 0) 
            
        }       
    }        
}
