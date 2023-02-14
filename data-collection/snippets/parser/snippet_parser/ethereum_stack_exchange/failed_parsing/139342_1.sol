pragma solidity ^0.8.0;

https:

contract Token is ERC20 {
    constructor(uint256 initialSupply) public ERC20 ("Token", "TKN"){
        _mint(msg.sender,initialSupply);
    }
}
