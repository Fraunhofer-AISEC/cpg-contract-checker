pragma solidity ^0.4.24;



constructor() public {
    _balanceOf[msg.sender] = _totalSupply;
}
