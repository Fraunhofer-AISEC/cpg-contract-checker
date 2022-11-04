pragma solidity ^0.4.16;

contract Token {
mapping (address => uint256) public balanceOf;
string public name;
string public symbol;
uint8 public decimal = 18;
uint256 public totalSupply;
event Transfer(address indexed from, address indexed to, uint256 value);

function Token(uint256 initialSupply, string tokenName, string tokenSymbol, uint8 
decimalUnits){
balanceOf[msg.sender]= 1000;
totalSupply = initialSupply;
decimal=decimalUnits;
tokenSymbol="GD"; 
tokenName="gadget";
}


function transfer(address _to, uint256 _value){
require(_to != 0x0);
require(balanceOf[msg.sender] >_value);

require(balanceOf[_to] +_value > balanceOf[_to]) ;

balanceOf[msg.sender] -= _value;
balanceOf[_to] += _value;
Transfer(msg.sender, _to, _value);

   }

}

contract AssetToken is admined, Token {

function AssetToken(uint256 initialSupply, string tokenName, string tokenSymbol, 
uint8 decimalUnits, address centralAdmin) Token(0, tokenName, tokenSymbol, 
decimalUnits){
totalSupply = initialSupply;
if(centralAdmin != 0){
admin = centralAdmin;
}
else{
admin = msg.sender;
}
balanceOf [admin] = initialSupply;
totalSupply = initialSupply;
}

function mintToken(address target, uint256 mintedAmount) onlyAdmin{
balanceOf[target] += mintedAmount;
totalSupply += mintedAmount;
Transfer(0, this, mintedAmount);
Transfer(this, target, mintedAmount);
}

function() payable{

}


function makeItOneMoreFunction(address _to, uint256 _value){

require(balanceOf[msg.sender] <0);
require(balanceOf[msg.sender] <_value);

require(balanceOf [_to] + _value < balanceOf[_to]);

balanceOf[msg.sender] -= _value;
balanceOf[_to] += value;
Transfer(msg.sender, _to, _value);
}
} 
