

pragma solidity 0.8.7;

import './IERC20.sol';

Contract SimpleContract {
    
    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    receive() payable external {}
            
    function withdrawEth(address to, uint256 amount) external onlyOwner {
        (bool success, ) = payable(address).call{value: amount}();
        require(success); 
    }
        
    function withdrawERC20(address tokenAddress, address to, uint256 amount) external onlyOwner {
        IERC20(tokenAddress).transfer(to, amount);
    }
    
}
