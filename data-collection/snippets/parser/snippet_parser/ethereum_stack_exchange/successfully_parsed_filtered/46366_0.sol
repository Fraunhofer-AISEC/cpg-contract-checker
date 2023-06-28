pragma solidity ^0.4.9;

contract showBalance{
    address owner = 0xca35b7d915458ef540ade6068dfe2f44e8fa733c;
    uint256 public showBalance = owner.balance;
}
