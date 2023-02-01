
pragma solidity ^0.8.2;

import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

contract MyToken is Initializable, ERC20Upgradeable {
    
    constructor() initializer {}

    function initialize() initializer public {
        __ERC20_init("MyToken", "MTK");

        _mint(msg.sender, 10000000 * 10 ** decimals());
    }
}
