

pragma solidity ^0.6.0;

import './NewToken.sol';
import './OldToken.sol';
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract GetNewToken {

    string  public name = "Get New Token Contract";
    address public owner;
    NewToken public newToken;
    OldToken public oldToken;

    event Bought(address buyer, uint256 amount);
    event TransferFromFailed(uint256 amount);
    
    constructor(NewToken _newToken, OldToken _oldToken) public {
        newToken = _newToken;
        oldToken = _oldToken;
        owner = msg.sender;
    }

    function buyTokens(uint256 _amount) public {
        require(_amount > 0, "amount can not be 0");
        uint256 userBalance = oldToken.balanceOf(msg.sender);

        require(userBalance >= _amount, "Not enough Old Token in your account");
        bool success = oldToken.transferFrom(msg.sender, address(this), _amount);

        if(success) {
            uint256 newBalance = newToken.balanceOf(address(this));
            require(_amount <= newBalance, "Not enough New Tokens in the contract");
            newToken.transfer(msg.sender, _amount);
            emit Bought(msg.sender, _amount);
        } else {
            emit TransferFromFailed(_amount);
            revert("oldToken.transferFrom function failed");
        }

    }
}

