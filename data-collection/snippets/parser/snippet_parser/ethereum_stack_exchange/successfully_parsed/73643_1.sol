pragma solidity ^0.5.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v2.3.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v2.3.0/contracts/token/ERC20/ERC20Detailed.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v2.3.0/contracts/token/ERC20/ERC20Capped.sol";

contract CappedToken is ERC20, ERC20Detailed, ERC20Capped {

    constructor () 
        ERC20Detailed("Capped Token", "TKN", 18) 
        ERC20Capped(1000000 * (10 ** 18))
        public
    {

    }
}
