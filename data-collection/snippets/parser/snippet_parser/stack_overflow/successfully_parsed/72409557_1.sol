
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract MintWithERC20 {
    IERC20 token;
    uint256 public cost = 1 * 10**18;

    
    constructor(address _addressToken) {
        token = IERC20(_addressToken);
    }

    
    function depositToken(uint _amount, uint _mintAmount) public {
        require(_amount >= cost * _mintAmount);
        token.transferFrom(msg.sender, address(this), _amount);
    }

    
    function getSmartContractBalance() external view returns(uint) {
        return token.balanceOf(address(this));
    }
} 
