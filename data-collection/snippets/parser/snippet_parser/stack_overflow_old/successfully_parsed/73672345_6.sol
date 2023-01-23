
pragma solidity ^0.8.0;


import '@openzeppelin/contracts/token/ERC20/ERC20.sol';

contract MyToken is ERC20 {

    uint256 private _totalSupply;
    constructor(string memory name_,string memory symbol_, uint totalSupply_ )  ERC20(name_, symbol_) {
        _totalSupply = totalSupply_;
    }

    function foo() external  returns (uint) {
      uint temp;
      temp = 1+1;
      return temp;
    }

}
