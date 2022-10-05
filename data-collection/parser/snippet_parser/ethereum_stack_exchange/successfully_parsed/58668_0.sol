pragma solidity ^0.4.24;

import "../node_modules/zeppelin-solidity/contracts/ownership/Ownable.sol";

contract PromotedDapp is Ownable{

    uint price;
    address tokenOwner;
    uint nextOwnerAllowed;

    constructor() public {
        owner = msg.sender;
    }

    function becomeOwner() public {
        require(now >= nextOwner);
        nextOwnerAllowed = now + 604800; 
        tokenOwner = msg.sender;
    }

}
