pragma solidity ^0.4.21;

contract WHITELIST {
    address owner;

    mapping(address => bool) public DignityWhitelist;

    modifier isWhitelisted() {
        require(DignityWhitelist[msg.sender] == true);
        _; 
    }

    modifier isOwner() {
        require(msg.sender == owner);
        _;
    }

    function WHITELIST() public {
        owner = msg.sender;
        DignityWhitelist[msg.sender] = true;
    }

    function enableWhitelist(address whitelistAddress) external isOwner {
        DignityWhitelist[whitelistAddress] = true;
    }

    function disableWhitelist(address removeAddress) external isOwner {
        require(removeAddress != owner);
        DignityWhitelist[removeAddress] = false;
    }
}
