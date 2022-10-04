pragma solidity ^0.8;

contract MyContract {
    struct PackedBalance {
        uint256 balance;
        uint256 locked_balance;
    }

    mapping(address => PackedBalance) balance;
    
    function setBalanceForAddress(address _address, uint256 _balance, uint256 _lockedBalance) external {
        balance[_address] = PackedBalance(_balance, _lockedBalance);
    }
}
