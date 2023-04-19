pragma solidity ^0.8.17;


interface Ether {
function register(address ref_address, string memory ether_name) external payable;
}


contract Contract2{

address ether_contract=0xDC7dBb61E31D7a79376063791183A6488E16C9ce;

function transfer () public payable{}
    receive() external payable {}
    fallback() external payable {}

function register(string memory ether_name) public payable
{
Ether(ether_contract).register(0x0000000000000000000000000000000000000000,ether_name);
}


}```
