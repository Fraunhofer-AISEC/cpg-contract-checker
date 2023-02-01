
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract SomeClassNameHere is ERC20 {
    constructor() ERC20("MyToken", "MTK") {}
}
