pragma solidity ^0.4.17;

contract Coin {
    mapping (address => uint) balances;

    function Coin() public {
        balances[msg.sender] = 100;
    }

    function sendCoin(address receiver, uint amount) public returns (bool) {
        require(balances[msg.sender] >= amount);
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        return true;
    }

    function getBalance() public view returns (uint) {
        return balances[msg.sender];
    }
}
