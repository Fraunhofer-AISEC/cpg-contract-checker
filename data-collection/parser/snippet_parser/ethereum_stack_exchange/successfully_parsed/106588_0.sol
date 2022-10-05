pragma solidity ^0.8.4; MIT

contract TRC20 {
        
    string public name;
    string public symbol;
    unit8 public decimals = 8;
    unit256 public totalsupply;
    
    mapping (address => unit256) public balanc0f;
    mapping (address => mapping(address=>unit256)) public allowance;
    
    event Transfer(address indexed from, address indexed to, unit256 value);
    event Approval(address indexed _owner, address indexed _spender, unit256 value);
    event Burn(address indexed from, unit256 value);
}