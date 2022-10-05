pragma solidity ^0.8;

interface IERC20 {
    function transfer(address recipient, uint256 amount) external returns (bool);
}

contract MyContract {

    
    
    function foo() external payable {
        IERC20 tokenContract = IERC20(address(0x456));
        
        tokenContract.transfer(msg.sender, 1);
    }
}
