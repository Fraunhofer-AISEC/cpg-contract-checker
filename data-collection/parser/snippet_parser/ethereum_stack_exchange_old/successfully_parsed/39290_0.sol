pragma solidity ^0.4.11;

import './IERC20.sol';
import './SafeMath.sol';

contract testcoin{

    using SafeMath for uint256;

    uint public _totalSupply = 0;

    string public constant symbol = "TES";
    string public constant name = "testcoin";
    uint8 public constant decimals = 3;
    string public contractString = 'hello';

    uint256 public constant RATE = 500;
    address public owner;

    mapping(address => uint256) balances;
    mapping(address => mapping(address => uint256)) allowed; 

    function releaseToken(string _string)  payable{
        require(keccak256(_string) == keccak256(contractString));
        createTokens();
    }

    function testcoin(){
        owner = msg.sender;
    }

    function totalSupply() constant returns (uint256 totalSupply){
        return _totalSupply;
    }

    function balanceOf(address _owner) constant returns (uint256 balance){
        return balances[_owner];
    }

    function transfer(address _to, uint256 _value) returns (bool success){
        require(
            balances[msg.sender] >= _value
            && _value > 0
        );
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        Transfer(msg.sender, _to, _value);
        return true;
    }

    function createTokens() payable {
        uint256 tokens = msg.value.mul(RATE);
        balances[msg.sender] = balances[msg.sender].add(tokens);
        _totalSupply = _totalSupply.add(tokens);
        owner.transfer(msg.value);
    }

    function totalSupply() constant returns (uint256 totalSupply){
        return _totalSupply;
    }

    function balanceOf(address _owner) constant returns (uint256 balance){
        return balances[_owner];
    }

    function transfer(address _to, uint256 _value) returns (bool success){
        require(
            balances[msg.sender] >= _value
            && _value > 0
        );
        balances[msg.sender] = balances[msg.sender].sub(_value); 
        balances[_to] += _value;
        Transfer(msg.sender, _to, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) returns (bool success){
        require(
            allowed[_from][msg.sender] >= _value
            && balances[_from] >= _value
            && _value > 0
        );
        balances[_from] -= _value;
        balances[_to] += _value;
        allowed[_from][msg.sender] -= _value;
        Transfer(_from, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value) returns (bool success){
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        return true;
    }

    function allowance(address _owner, address _spender) constant returns (uint256 remaining){
        return allowed[_owner][_spender];
    }

    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}
