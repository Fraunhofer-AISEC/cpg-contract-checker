pragma solidity ^0.8;

contract MyContract {
    mapping(address => uint256) balance;
    
    function setBalanceForAddress(address _address, uint256 _balance) external {
        balance[_address] = _balance;
    }
}
