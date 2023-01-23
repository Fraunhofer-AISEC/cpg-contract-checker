pragma solidity ^0.5.2;


import "./ERC20Detailed.sol";


contract MyToken is ERC20, ERC20Detailed {       

    constructor(string memory _name, string memory _symbol, uint8 _decimals) 
        ERC20Detailed(_name, _symbol, _decimals)
        public
    {

    }


}
