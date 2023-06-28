pragma solidity ^0.5.16;



contract YarockToken{



uint public totalSupply;

mapping(address=> uint256) public balanceOf;

constructor(uint256 _initialSupply) public{
    balanceOf[msg.sender]=_initialSupply;
    totalSupply=_initialSupply;
}

}
