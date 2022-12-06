pragma solidity ^0.5.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v2.5.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v2.5.0/contracts/token/ERC20/ERC20Detailed.sol";

contract GGCoin is ERC20, ERC20Detailed {

    address owner;

    constructor () public ERC20Detailed("GGCoin", "GGC", 2) {
        _mint(msg.sender, 100000);
        owner = msg.sender;
    }

    function mint(uint256 amount) public {
        require(msg.sender == owner);
        _mint(msg.sender, amount);
    }

}
