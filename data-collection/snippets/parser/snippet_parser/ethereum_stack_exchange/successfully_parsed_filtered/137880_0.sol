

pragma solidity ^0.8.13;

import "./ConvertLib.sol";





contract MetaCoin {
    mapping(address => uint256) balances;

    uint256 transactionCount = 0;

    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    constructor() {
        balances[tx.origin] = 10000;
    }

    function sendCoin(address receiver, uint256 amount)
        public
        returns (bool sufficient)
    {
        if (balances[msg.sender] < amount) return false;
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        transactionCount++;
        emit Transfer(msg.sender, receiver, amount);
        return true;
    }

    function getBalanceInEth(address addr) public view returns (uint256) {
        return ConvertLib.convert(getBalance(addr), 2);
    }

    function getBalance(address addr) public view returns (uint256) {
        return balances[addr];
    }
}
