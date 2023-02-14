
pragma solidity 0.8.0;

import "./Registry.sol";
import "./interfaces/IPlatform.sol";

contract Platform is IPlatform {

    address public registry;
    address public platformWallet;
    address public admin;

    constructor() {
        admin = msg.sender;
        platformWallet = msg.sender;

        Registry registryContract = new Registry(address(this));
        registry = address(registryContract);

    }
}