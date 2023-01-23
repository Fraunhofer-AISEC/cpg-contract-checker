pragma solidity ^0.5.0;

contract Variables {

string public one = "One";
int public two = -2;
uint public tree = 3;
address public myaddress = msg.sender;

mapping(address => estructura) map;

struct estructura {
uint four;
uint five;
}

function setestructura(uint a, uint b) public {
map(myaddress).four = a;
map(myaddress).five = b;
}



}   
