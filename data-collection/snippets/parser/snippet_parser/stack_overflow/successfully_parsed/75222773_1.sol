pragma solidity ^0.8;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyContract is ERC20 {
    constructor() ERC20("MyToken", "MyT") {}

    function decimals() override public pure returns (uint8) {
        return 2;
    }
}
