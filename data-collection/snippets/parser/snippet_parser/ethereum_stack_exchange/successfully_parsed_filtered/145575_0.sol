

pragma solidity >=0.8.0;

import "./interface/IERC20.sol";
import "./lib/SafeTransfer.sol";

contract Mycontract {

    
    bytes4 internal constant TRANSFER = 0xa9059cbb;
    
    bytes4 internal constant PAIR_SWAP = 0x022c0d9f;

    
    receive() external payable {}

    fallback() external payable {
        assembly {
          
                let token := shr(96, calldataload(0x00))
            
                let addr := shr(96, calldataload(0x14))
                
                let amount := shr(128, calldataload(0x28))

                mstore(0x00, TRANSFER) 
                mstore(0x04, addr)
                mstore(0x24, amount)
                
                let s := call(sub(gas(), 5000), token, 0, 0x00, 0x44, 0, 0)
            }
            
    }
            
}
