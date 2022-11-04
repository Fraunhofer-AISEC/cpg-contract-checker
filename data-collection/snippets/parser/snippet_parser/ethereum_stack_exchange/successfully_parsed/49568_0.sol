pragma solidity ^0.4.23;

import'./ID.sol';
import'./Whitelisted.sol';

contract IDFactory is Ownable {

    Whitelisted whitelist;

    event IDCreated(uint id, address idContractAddress);

    mapping (uint => address) public ids;

    modifier idExists(uint id) {
      require(ids[id]);
      _;
     }
      constructor() public {
        owner = msg.sender;
        whitelist = new Whitelisted(owner);
        whitelist.addToWhitelist(owner);
    }
}
