
pragma solidity 0.8.0;

import "./interfaces/IRegistry.sol";
import "./interfaces/IPlatform.sol";

contract Registry is IRegistry {

    IPlatform public platform;

    address public platformWallet;
    address public admin;

    constructor() {
        platform = IPlatform(msg.sender); 
    }
}