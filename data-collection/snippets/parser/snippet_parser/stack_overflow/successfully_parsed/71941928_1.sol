pragma solidity ^0.8.7;


import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";

contract TokenTransfer {
    IERC20 _token;

    
    constructor(address token) public {
        _token = IERC20(token);
    }
    
    
    function stake(address to, uint amount) public {
        _token.approve(address(this), amount);
        
        require(_token.allowance(address(this), address(this)) >= amount);
        _token.transferFrom(msg.sender, to, amount);
    }
}
