pragma solidity ^0.8.4;

import "./tokens/ERC20.sol";

contract Sample3 is ERC20 {

    constructor() ERC20("Sample3", "SP3", 18, 58000000000, 1) {    
    }
}
