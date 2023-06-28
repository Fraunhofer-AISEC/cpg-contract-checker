pragma solidity ^0.4.0;

contract Coin {
    address public minter;
    string public name;
    mapping (address => uint) public balances;

    event Sent(address from, address to, uint amount);

    function Coin() public {
        minter = msg.sender;
        name = 'MyCoin';
    }

    
    function mint(address _reciever, uint _amount) public {
        if (msg.sender != minter) return;
        balances[_reciever] += _amount;
    }

    
    function send(address _reciever, uint _amount) public {
        if (balances[msg.sender] < _amount) return;
        balances[msg.sender] -= _amount;
        balances[_reciever] += _amount;
        Sent(msg.sender, _reciever, _amount);
    }

    function getBalance(address _user) public view returns (uint){
        return balances[_user];
    }

    function balances(address _account) public view returns (uint, string) {
        return (balances[_account], name);
    }
}
