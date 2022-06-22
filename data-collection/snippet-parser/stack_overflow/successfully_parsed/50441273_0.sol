pragma solidity ^0.4.21;

contract WHITELIST {

    mapping(address => bool) public DignityWhitelist;

    modifier isWhitelisted() {
        require(DignityWhitelist[msg.sender] == true);
        _; 
    }

    function WHITELIST (address initialAccount) public {
        if(initialAccount == 0x0) {
            initialAccount = msg.sender;
        }
        DignityWhitelist[initialAccount];
    }

    function enableWhitelist(address whitelistAddress) external {
        DignityWhitelist[whitelistAddress] = true;
    }

    function disableWhitelist(address removeAddress) external {
        DignityWhitelist[removeAddress] = false;
    }
}
