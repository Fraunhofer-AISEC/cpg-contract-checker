pragma solidity 0.4.24;

import './DetailedERC20.sol';

contract OwnToken is DetailedERC20
{
    constructor(uint256 initialAmount, string _name, uint8 _decimals, string _symbol) 
    DetailedERC20(_name, _symbol, _decimals) 
    public
    {
        totalSupply_ = initialAmount;
        balances[msg.sender] = initialAmount;
    }
}
