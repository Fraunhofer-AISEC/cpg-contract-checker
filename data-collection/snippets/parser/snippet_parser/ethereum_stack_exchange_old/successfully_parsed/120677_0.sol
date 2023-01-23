
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyContract is ERC20 {

    constructor() public payable ERC20("MyContract", "MYCT") {}

    function mintOverride() public payable {
        address payable addressOne = payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2); 
        address payable addressTwo = payable(0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db); 
        require(msg.value >= 0.05 ether, "Not enough ETH sent; check price!");   
        _mint(msg.sender, 1);
    }
}
