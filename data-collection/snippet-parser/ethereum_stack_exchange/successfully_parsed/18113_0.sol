pragma solidity 0.4.11;

contract MyToken {
string public name;
string public symbol;
uint8 public decimals;
string public standard = 'RNTLcoin 0.1';
uint256 public totalSupply;

mapping (address => uint256) public balanceOf;

event Transfer(address indexed from, address indexed to, uint256 value);

function MyToken(
    uint256 initialSupply, 
    string tokenName, 
    uint8 decimalUnits, 
    string tokenSymbol){
    balanceOf[msg.sender] = initialSupply;              
    name = tokenName;
    symbol = tokenSymbol;
    decimals = decimalUnits;    
    }


function transfer(address _to, uint256 _value) {
    if (balanceOf[msg.sender] < _value) throw;           
    if (balanceOf[_to] + _value < balanceOf[_to]) throw; 
    balanceOf[msg.sender] -= _value;                     
    balanceOf[_to] += _value;                            


} }
