pragma solidity 0.8.4;

import "@openzeppelin/contracts/proxy/transparent/TransparentUpgradeableProxy.sol";

import "./interfaces/IProxyInitialize.sol";


contract ERC20TokenFactory{

    address public logicImplement;

    event TokenCreated(address indexed token);

    constructor(address _logicImplement) {
        logicImplement = _logicImplement;
    }

    function createBEP20Token(string calldata name, string calldata symbol, uint8 decimals, uint256 amount, bool mintable, address erc20Owner, address proxyAdmin) external returns (address) {
        TransparentUpgradeableProxy proxyToken = new TransparentUpgradeableProxy(logicImplement, proxyAdmin, "");

        IProxyInitialize token = IProxyInitialize(address(proxyToken));
        token.initialize(name, symbol, decimals, amount, mintable, erc20Owner);
        emit TokenCreated(address(token));
        return address(token);
    }
}




pragma solidity ^0.8.0;

interface IProxyInitialize {
    function initialize(string calldata name, string calldata symbol, uint8 decimals, uint256 amount, bool mintable, address owner) external;
}
