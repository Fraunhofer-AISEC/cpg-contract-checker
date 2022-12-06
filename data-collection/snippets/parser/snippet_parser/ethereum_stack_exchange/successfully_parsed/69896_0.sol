pragma solidity ^0.5.0;

import "./DappToken.sol";

contract DappTokenSale {

    address admin;
    DappToken public tokenContract;

    constructor (DappToken _tokenContract) public {
        admin = msg.sender;
        tokenContract = _tokenContract;

    }   
}
