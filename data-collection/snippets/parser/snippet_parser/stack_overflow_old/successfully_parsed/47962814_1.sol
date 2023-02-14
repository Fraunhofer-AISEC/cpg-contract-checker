pragma solidity ^0.4.11;

import './IERC20.sol';
import './SafeMath.sol';

contract AToken is IERC20 {
    
    using SafeMath for uint256;
    
    uint256 public _totalSupply = 0;
    uint256 public constant hardLimit = 45000000;
    string public constant symbol = "ABC";
    string public constant name = "Alphabet";
    uint8 public constant decimals = 18;
    
    //1 ETH = 25000 Alphabet
    uint256 public constant RATE = 25000;
    
    address public owner;
    
    mapping(address => uint256) balances;
    mapping(address => mapping(address => uint256)) allowed;
    
    function () payable {
        createTokens();
    }
    
    function SnapToken() {
        owner = msg.sender;
    }
    
    function createTokens() payable {
        //require(msg.value > 0);
        //uint256 tokens = msg.value.mul(RATE);
        //require(tokens.add(_totalSupply) <= hardLimit);
        //balances[msg.sender] = balances[msg.sender].add(tokens);
        //_totalSupply = _totalSupply.add(tokens);
        //owner.transfer(msg.value);
    }
    
    function totalSupply() constant returns (uint256 totalSupply) {
        return _totalSupply;
    }
    
    function balanceOf(address _owner) constant returns (uint256 balance) {
        return balances[_owner];
    }
    
    function transfer(address _to, uint256 _value) returns (bool success) {
        require(balances[msg.sender] >= _value && _value > 0);
        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        Transfer(msg.sender, _to, _value);
        return true;
    }
    
    function transferFrom(address _from, address _to, uint256 _value) returns (bool success) {
        require(allowed[_from][msg.sender] >= _value && balances[_from] >= _value && _value > 0);
        balances[_from] = balances[_from].sub(_value);
        balances[_to] = balances[_to].add(_value);
        allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
        Transfer(_from, _to, _value);
        return true;
    }
    
    function approve(address _spender, uint256 _value) returns (bool success) {
        //allowed[msg.sender][_spender] = allowed[msg.sender][_spender].add(_value);
        Approval(msg.sender, _spender, _value);
        return true;
    }
    
    function allowance(address _owner, address _spender) constant returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 value);
}