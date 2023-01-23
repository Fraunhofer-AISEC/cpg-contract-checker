pragma solidity ^0.8.0;


contract ERC20Interface {

mapping(address => uint256) private _balances;

mapping(address => mapping(address => uint256)) private _allowances;

uint256 private _totalSupply;

string public _name;
string public _symbol;

event Transfer(address indexed _from, address indexed _to, uint256 _value);
event Approval(address indexed _owner, address indexed _spender, uint256 _value);

}

contract SafeMath {
function safeAdd(uint a, uint b) public pure returns (uint c) {
    c = a + b;
    require(c >= a);
}

function safeSub(uint a, uint b) public pure returns (uint c) {
    require(b <= a); c = a - b; } function safeMul(uint a, uint b) public pure returns (uint c) { c = a * b; require(a == 0 || c / a == b); } function safeDiv(uint a, uint b) public pure returns (uint c) { require(b > 0);
    c = a / b;
   }
}



contract MyToken is ERC20Interface, SafeMath {

string public name;
string public symbol;
uint8 private decimals; 

uint256 public _totalSupply;

mapping(address => uint256) balances;
mapping(address => mapping(address => uint256)) allowed;


constructor() {
    name = "MyToken";
    symbol = "DDDF545";
    decimals = 0;
    _totalSupply = 100000000000000000000000000;

    balances[msg.sender] = _totalSupply;
    emit Transfer(address(0), msg.sender, _totalSupply);
}


function name() public view virtual override returns (string _name){
    return _name = name; 
   }
}
