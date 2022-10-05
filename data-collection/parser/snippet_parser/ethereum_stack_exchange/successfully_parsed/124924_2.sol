
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/proxy/transparent/ProxyAdmin.sol";
contract MyAdmin is ProxyAdmin {
    constructor() ProxyAdmin() {}
}
