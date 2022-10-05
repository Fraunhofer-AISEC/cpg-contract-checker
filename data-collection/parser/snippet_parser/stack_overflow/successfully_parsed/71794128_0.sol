pragma solidity ^0.8.0;

contract MetaCoin {

    mapping (address => uint) balances;

    event Transfer(address indexed _from, address indexed _to, uint _value);    

    constructor() public {
        balances[msg.sender] = 10000;
    }

    function transfer(address receiver, uint amount) public returns(bool sufficient) {
        if (balances[msg.sender] >= amount)
            return false;

        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Transfer(msg.sender, receiver, amount);   
        return true;
    }

    function get_balance(address account) public view returns(uint) {
        return balances[account];
    }
}
