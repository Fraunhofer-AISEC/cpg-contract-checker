pragma solidity ^0.4.23;

import'./Whitelisted.sol';

contract ID{

    uint id;
    Whitelisted whitelist;
    mapping (string => MessageData) public messages;

    event MessageSaved(string messageHash);

    constructor(uint _id, address _whitelist) public {
        owner = msg.sender;
        id = _id;
        whitelist = Whitelisted(_whitelist);
    }

    struct MessageData {
        string messageSender;
        uint64 timestamp;
    }
}

pragma solidity ^0.4.23;

import 'Ownable.sol';

contract Whitelisted is Ownable {

    constructor(_owner) public {
        owner = _owner;
    }

    mapping(address => bool) internal whitelistedAddresses;

    function isWhitelisted(address addr) internal view returns (bool) {
        return whitelistedAddresses[addr];
    }

    function addToWhitelist(address addr) public onlyOwner {
        require(!isWhitelisted(addr));
        whitelistedAddresses[addr] = true;
    }

    function removeFromWhitelist(address addr) public onlyOwner {
        require(isWhitelisted(addr));
        whitelistedAddresses[addr] = false;
    }

    modifier onlyWhitelisted {
        require(isWhitelisted(msg.sender));
        _;
    }
}
