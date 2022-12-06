

pragma solidity >=0.8.0;

import "./interface/IERC20.sol";
import "./lib/SafeTransfer.sol";

contract Sandwich {
    using SafeTransfer for IERC20;
    
    address internal immutable user;

    
    bytes4 internal constant ERC20_TRANSFER_ID = 0xa9059cbb;

    
    bytes4 internal constant PAIR_SWAP_ID = 0x022c0d9f;

    
    receive() external payable {}

    constructor(address _owner) {
        user = _owner;
    }

    
    function recoverERC20(address token) public {
        require(msg.sender == user, "shoo");
        IERC20(token).safeTransfer(
            msg.sender,
            IERC20(token).balanceOf(address(this))
        );
    }

    
    fallback() external payable {
        
        address memUser = user;

        assembly {
            
            if iszero(eq(caller(), memUser)) {
                
                
                revert(3, 3)
            }

            
            

            
            let token := shr(96, calldataload(0x00))
            
            let pair := shr(96, calldataload(0x14))
            
            let amountIn := shr(128, calldataload(0x28))
            
            let amountOut := shr(128, calldataload(0x38))
            
            let tokenOutNo := shr(248, calldataload(0x48))

            

            
            mstore(0x7c, ERC20_TRANSFER_ID)
            
            mstore(0x80, pair)
            
            mstore(0xa0, amountIn)

            let s1 := call(sub(gas(), 5000), token, 0, 0x7c, 0x44, 0, 0)
            if iszero(s1) {
                
                revert(3, 3)
            }

            
            

            
            mstore(0x7c, PAIR_SWAP_ID)
            
            switch tokenOutNo
            case 0 {
                mstore(0x80, amountOut)
                mstore(0xa0, 0)
            }
            case 1 {
                mstore(0x80, 0)
                mstore(0xa0, amountOut)
            }
            
            mstore(0xc0, address())
            
            mstore(0xe0, 0x80)

            let s2 := call(sub(gas(), 5000), pair, 0, 0x7c, 0xa4, 0, 0)
            if iszero(s2) {
                revert(3, 3)
            }
        }
    }
}
