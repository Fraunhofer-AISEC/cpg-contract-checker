

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract UsingERC20 {
    IERC20 public associatedToken;

    
    constructor(IERC20 _token) public {
        associatedToken = _token;
    }
        function approveContract() public {
        associatedToken.approve(address(this), 100000);
    }

    function doSomethingThatRequiresERC20tokens() public {
        
        
        
        

        
        

        
        
        
        associatedToken.transferFrom(msg.sender, address(this), 100);

        
        emit YayIReceivedTokens(100, msg.sender, associatedToken.balanceOf(address(this)));
    }

    event YayIReceivedTokens(uint256 amount, address fromAccount, uint256 totalBalance);
}
