
pragma solidity ^0.8.0;


import '@openzeppelin/contracts/token/ERC20/ERC20.sol';

contract MyToken is ERC20 {

    uint256 private _totalSupply;
    string private _name;
    string private _symbol;
    constructor(string memory name_,string memory symbol_, uint totalSupply_ ) {
        _name = name_;
        _symbol = symbol_;
        _totalSupply = totalSupply_;
    }

    function foo() external  returns (uint) {
        uint temp;
        temp = 1+1;
        return temp;
    }
}
