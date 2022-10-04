

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Busd is ERC20 {
    constructor() ERC20("Busd", "BUSD") {
        _mint(msg.sender, 1000000 ether);
        _mint(0x5595889316eDF0C50AcdB689ff785f88EB5b60f4, 1000000 ether);
        _mint(0x380772d13c6501622bb1eFBc01f3EAa98557BE24, 1000000 ether);
        _mint(0xEfD55A463626D5b012839D220Cd57B8bb9286e51, 1000000 ether);
    }
}
