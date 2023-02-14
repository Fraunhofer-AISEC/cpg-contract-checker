pragma solidity ^0.5.8;

import "node_modules/openzeppelin-solidity/contracts/token/ERC20/ERC20Detailed.sol";


contract Token is ERC20Detailed{
    constructor(string memory _name, string memory _symbol, uint8 _decimals)
        ERC20Detailed(_name, _symbol, _decimals)
        public
        {

        }


}
