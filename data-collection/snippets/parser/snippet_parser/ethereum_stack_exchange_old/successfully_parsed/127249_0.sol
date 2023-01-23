
pragma solidity ^0.8.0;

import "./FoWERC20.sol";





contract Vendor is Ownership {
    
    address vendorOwner;

    FoWERC20 fowERC20; 

    event BuyTokenEvent(address indexed purchasedBy, address indexed purchasedFrom, uint256 ethValue);
    event SellTokenEvent(address indexed soldBy, address indexed soldTo, uint256 ethValue);
    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    constructor(address _fowERC20){
        vendorOwner = msg.sender;
        fowERC20 = FoWERC20(_fowERC20);
        
    }

    function buyToken() external payable returns(bool success){
        
        uint256 tokensPerEther = 500;
        
        require(msg.value >= 1 ether, "Not enough funds");
        
        require(fowERC20.balanceOf(address(this)) >= tokensPerEther, "Not enough Tokens");
        
        (bool _success) = fowERC20.transfer(msg.sender, (msg.value / 1 ether) * tokensPerEther);      
        emit BuyTokenEvent(msg.sender, address(this), msg.value);
        return _success;
    }

    function sellToken(uint256 howManyTokens) external payable returns(bool){
        
        require(howManyTokens % 500 == 0, "Must sell in quantities of 500");
        
        require(address(this).balance >= 1.1 ether, "Contract balance has less than 1.1 ether");
        
        fowERC20.approve(address(this), howManyTokens);
        
        fowERC20.transferFrom(msg.sender, address(this), howManyTokens);
        
        (bool success,) = msg.sender.call{value: (howManyTokens * 1e18 )}("");
        emit SellTokenEvent(msg.sender, address(this), msg.value);
        return success;
    }

}
