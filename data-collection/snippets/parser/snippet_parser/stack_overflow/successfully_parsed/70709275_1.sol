
pragma solidity ^0.7.0;

import "../openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import "../openzeppelin-contracts/contracts/math/SafeMath.sol";

contract MyERC20 is ERC20 {
    uint256 public INITIAL_SUPPLY = 20000;
constructor() ERC20("MyToken", "MYT") {
        _mint(msg.sender, INITIAL_SUPPLY);
    }
}
