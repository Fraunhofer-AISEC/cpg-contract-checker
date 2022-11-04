

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract BurnMe is ERC20 {
    constructor() ERC20("Burn me", "BURN"){}

    function mint() external {
        _mint(msg.sender, 10000);
    }

    function burn(address account, uint256 amount) external {
        _spendAllowance(account, _msgSender(), amount);
        _burn(account, amount);
    }
}
