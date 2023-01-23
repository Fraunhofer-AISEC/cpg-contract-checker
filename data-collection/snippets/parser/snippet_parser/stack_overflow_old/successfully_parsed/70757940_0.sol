
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Shiaf is ERC20 {
    constructor() ERC20("Shiaf", "MTK") {
        _mint(msg.sender, 10000000 * 10 ** decimals());
    }
}
