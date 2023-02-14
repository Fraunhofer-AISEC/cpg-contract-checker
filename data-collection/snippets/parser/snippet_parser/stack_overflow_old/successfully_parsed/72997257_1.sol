
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    constructor() ERC20("MyToken", "MTK") {
        _mint(msg.sender, 5000 * 10 ** decimals());
    }

    function decimals() override public view returns (uint8) {
        return 8;
    }
}
