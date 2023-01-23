pragma solidity 0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20Detailed.sol";

contract CExampleToken is ERC20 {
    constructor() ERC20("CExample", "CEXT") {
      _mint(msg.sender, 25000000);
    }
}
