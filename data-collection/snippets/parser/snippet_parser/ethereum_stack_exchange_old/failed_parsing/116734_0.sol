

pragma solidity ^0.6.2;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract deCent is ERC20 {

    constructor () public ERC20("deCent", "DCT") {
        _mint(msg.sender; 1000000 * 10 ** uint256(decimals()))));
    }
}
