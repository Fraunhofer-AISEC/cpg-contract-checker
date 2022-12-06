pragma solidity ^0.4.0;

contract Testcoin {
    address public creator;
    mapping (address => uint) public balances;

    event Delivered(address from, address to, uint amount);
    event StringLogger(string message);

    function TestCoin() {
        creator = msg.sender;
    }

    function create(address receiver, uint amount) {
        if (msg.sender != creator){ 
            emit StringLogger('This Account is not allowed too create tokens.');
            revert();
        }
        balances[receiver] += amount;
    }

    function transfer(address receiver, uint amount) {
        if (balances[msg.sender] < amount){         
            emit StringLogger('Not enough balance');
            revert();
        }
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Delivered(msg.sender, receiver, amount);
    }

}
