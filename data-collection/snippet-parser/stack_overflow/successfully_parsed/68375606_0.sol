pragma solidity >=0.4.22 <0.9.0;

contract AstToken {
uint256 public totalSupply;

mapping(address => uint256) public balanceOf;

function AstToken (uint256 _initialSupply) public{
    balanceOf[msg.sender] = _initialSupply;
    totalSupply = _initialSupply;
}
}