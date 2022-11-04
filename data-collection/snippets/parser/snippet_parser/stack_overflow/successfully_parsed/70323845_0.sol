pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";


interface Split{
    function getAddressAndAmountToSplit() view external returns(address, uint);
}



contract MyBank {
    
    mapping (address => mapping(address => uint)) public userBalance;

    
    mapping (address => Split) splits;

    
    
    function addToBalance(IERC20 token, uint amount) external {
        token.transferFrom(msg.sender, address(this), amount);
        userBalance[address(token)][msg.sender] += amount;
    }

    
    function withdrawBalance(IERC20 token) external {
        token.transfer(msg.sender, userBalance[address(token)][msg.sender]);
        userBalance[address(token)][msg.sender] = 0;
    }

    
    function registerSplit(Split split) external {
        splits[msg.sender] = split;
    }

    
    
    function splitBalance(IERC20 token) external {
        Split split = splits[msg.sender];
        require(split != Split(address(0x0)));
        uint balance = userBalance[address(token)][msg.sender];
        (address dest, uint amount) = Split(split).getAddressAndAmountToSplit();
        userBalance[address(token)][dest] = amount;
        userBalance[address(token)][msg.sender] = balance - amount;
    }
}
