
pragma solidity >=0.4.22 <0.9.0;

import "openzeppelin-solidity/contracts/token/ERC20/DetailedERC20.sol";
import "openzeppelin-solidity/contracts/token/ERC20/StandardToken.sol";
    
    contract TestToken is Standard, DetailedERC20 {

        uint256 public totalSupply;

        constructor(string _name, string _symbol, uint8 _decimals) 
            DetailedERC20(_name, _symbol, _decimals) 
            public 
            {

            }
}
