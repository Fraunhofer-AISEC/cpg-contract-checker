pragma solidity ^0.4.24;

import "./DetailedERC20.sol";
import "./MintableToken.sol";
import "./BurnableToken.sol";

contract myToken is DetailedERC20, MintableToken, BurnableToken {
    constructor(
        string _name, 
        string _symbol, 
        uint8 _decimals
        )
        DetailedERC20(_name, _symbol, _decimals)
        public
    {

    }
}
