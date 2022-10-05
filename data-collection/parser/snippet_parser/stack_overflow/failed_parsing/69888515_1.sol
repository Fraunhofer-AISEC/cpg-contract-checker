pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/utils/Address.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract TestCoin is ERC20 {

    constructor(_name, _symbol) {
        _name = name();
        _symbol = symbol();
    }

    .......

    function excludeFromRewards(address account) public onlyOwner() {
        .......
    }

    .......
}
