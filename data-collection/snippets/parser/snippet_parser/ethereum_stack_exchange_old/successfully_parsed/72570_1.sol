pragma solidity 0.5.1;

contract SimpleWhitelist {

    address public owner;
    mapping(address => bool) public whitelist;

    event LogProtected(address sender);

    modifier onlyOwner {
        require(msg.sender == owner, "You are not the owner.");
        _;
    }

    modifier onlyWhitelist {
        require(whitelist[msg.sender], "You are not whitelisted.");
        _;
    }

    function setPermission(address user, bool isAllowed) public onlyOwner {
        whitelist[user] = isAllowed;
    }

    function protected() public onlyWhitelist {
        emit LogProtected(msg.sender);
    }    
}
