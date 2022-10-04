pragma solidity ^0.5.0;

import "http://github.com/OpenZeppelin/openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
import "http://github.com/OpenZeppelin/openzeppelin-solidity/contracts/token/ERC20/ERC20Detailed.sol";


contract SimpleToken is ERC20, ERC20Detailed {

    
    constructor () public ERC20Detailed("SimpleToken", "SIM", 18) {
        _mint(msg.sender, 10000 * (10 ** uint256(decimals())));
    }
}
