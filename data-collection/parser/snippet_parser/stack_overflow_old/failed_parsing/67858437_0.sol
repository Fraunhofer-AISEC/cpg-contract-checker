pragma solidity ^0.14.18;
contract MyToken {

mapping (address => uint256) public balanceOf;
}

function MyToken() {
balanceOf[msg.sender] = 21000000;
}


function transfer(address _to, uint256 _value) {

balanceOf[msg.sender] -= _value;
balanceOf[_to] += _value;
}

function transfer(address _to, uint256 _value) {

require(balanceOf[msg.sender] >= _value && balanceOf[_to] + _value >= balanceOf[_to]);

balanceOf[msg.sender] -= _value;
balanceOf[_to] += _value;
}


function MyToken(uint256 initialSupply, string tokenName, string tokenSymbol, uint8 decimalUnits) {
balanceOf[msg.sender] = initialSupply; 
name = tokenName; 
symbol = tokenSymbol; 
decimals = decimalUnits; 
}

event Transfer(address indexed from, address indexed to, uint256 value);


        Transfer(msg.sender, _to, _value);
