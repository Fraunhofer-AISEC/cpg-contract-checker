
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract CrowdCoin is ERC20 {
  uint constant _initial_supply = 100 * (10**18);
    
    constructor() ERC20("CrowdCoin", "CC") {
        _mint(msg.sender, _initial_supply);
    }

    function mint(uint amount) external {
        _mint(msg.sender, amount);
        emit Transfer(address(0), msg.sender, amount);
    }

    function burn(uint amount) external {
        _burn(msg.sender, amount);
        emit Transfer(msg.sender, address(0), amount);
    }
}
