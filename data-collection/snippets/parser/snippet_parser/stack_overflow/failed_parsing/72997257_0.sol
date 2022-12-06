
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {

    uint8 _decimals;

    constructor() ERC20("MyToken", "MTK") {

         _decimals = 3;

         function _setupDecimals(uint8 decimals_) internal {
            _decimals = decimals_;
         }

        _mint(msg.sender, 5000 * 10 ** decimals());

    }
}
