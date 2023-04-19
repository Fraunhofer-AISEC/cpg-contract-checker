
pragma solidity ^0.8.9;

import "./MyToken.sol";

contract Marketplace {
    MyToken token= new MyToken();

    constructor() {}

    function sell(address _address, uint256 tokenId) public {
       require(token.ownerOf(tokenId) == msg.sender, "Unauthorized.");
       require(_address != address(0));
    }
}
