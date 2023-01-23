pragma solidity ^0.4.0;

contract UnclearlyToken {

    string public constant name = "Unclearly";
    string public constant symbol = "UC";
    uint8 public constant decimals = 18;
    uint totalAmount = 10000000;

    mapping (address => uint256) public balances;
    mapping(address => mapping (address => uint256)) allowed;

    event Transfer(address indexed _from, address indexed _to, uint _value);
    event Approval(address indexed _owner, address indexed _spender, uint _value);

    function UnclearlyToken() {
        balances[msg.sender] = totalAmount;
    }

    function totalSupply() constant returns(uint) {
        return totalAmount;
    }

    function balanceOf(address _owner) constant returns(uint256) {
        return balances[_owner];
    }

    function transfer(address _to, uint _value) returns (bool success) {
        if(balances[msg.sender] >= _value 
            && _value > 0 
            && balances[_to] + _value > balances[_to]) {

            balances[msg.sender] -= _value;
            balances[_to] += _value;
            Transfer(msg.sender, _to, _value);

            return true;
        }
        return false;
    }

    function transferFrom(address _from, address _to, uint _value) returns (bool success) {
        if(balances[_from] >= _value
            && _value > 0 
            && balances[_to] + _value > balances[_to]
            && allowed[_from][msg.sender] >= _value) {

            balances[_from] -= _value;
            balances[_to] += _value;
            Transfer(_from, _to, _value);

            return true;
        }
        return false;
    }

    function approve(address _spender, uint _value) returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);

        return true;
    }

    function allowance(address _owner, address _spender) constant returns (uint remaining) {
        return allowed[_owner][_spender];
    }
}
