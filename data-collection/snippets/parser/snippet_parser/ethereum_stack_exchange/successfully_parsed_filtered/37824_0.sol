pragma solidity ^0.4.18;

import './XXERC20.sol';
import './SafeMath.sol';

   contract XXPreOrderToken is XXERC20 {

    using SafeMath for uint256;

    uint public _totalSupply = 72500000000000000000000;

    string public constant symbol ="XXPOT";
    string public constant name = "PreOrderToken";
    uint8 public constant decimals = 18;

    
    uint256 public constant RATE = 1000;

    address public owner;

    mapping(address => uint256) balances;
    mapping(address => mapping(address => uint256)) allowed;

    function() payable{
        createTokens();
    }

    function XXPreOrderToken() {
        balances[msg.sender] = _totalSupply;
        owner = msg.sender;
    }

    function createTokens() payable {
        require(msg.value > 0);

        uint256 tokens = msg.value.mul(RATE);
        balances[msg.sender] = balances[msg.sender].add(tokens);
        _totalSupply = _totalSupply.add(tokens);

        owner.transfer(msg.value);
    }

    function totalSupply() constant returns (uint256 totalSupply) {
        return _totalSupply;
    }

    function balanceOf(address _owner) constant returns (uint256 balance) {
        return balances[_owner];
    }

    function transfer(address _to, uint256 _value) returns (bool success) {
        require(
            balances[msg.sender] >= _value
            && _value > 0
            );
        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        Transfer(msg.sender, _to, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) returns (bool success) {
        require(
            allowed[_from][msg.sender] >= _value
            && balances[_from] >= _value
            && _value > 0
            );
            balances[_from] = balances[_from].sub(_value);
            balances[_to] = balances[_to].add(_value);
            allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
            Transfer(_from, _to, _value);
            return true;
    }

    function approve(address _spender, uint256 _value) returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        return true;
    }

    function allowance(address _owner, address _spender) constant returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }
}
