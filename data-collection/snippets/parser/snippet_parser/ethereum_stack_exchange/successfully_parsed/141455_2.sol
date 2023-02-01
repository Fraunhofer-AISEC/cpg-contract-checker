
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract XYZ is Ownable{
    
    mapping(address => bool) public allowedTokens;
    uint public _minAmount;

    constructor(uint minAmount){
        _minAmount = minAmount;
    }

    function allowAddress(address _token) public onlyOwner {
        allowedTokens[_token] = true;
    }

    function deposit(address _token, uint _amount) public payable {
        require(allowedTokens[_token] == true, "Token is not allowed/supported");
        require(_amount >= _minAmount, "Amount less than minimum amount");
        require(IERC20(token).allowance(msg.sender, address(this)), "Not approved to send balance requested");
        bool success = IERC20(token).transferFrom(msg.sender, address(this), _amount);
        require(success, "Transaction was not successful");
    }
}
