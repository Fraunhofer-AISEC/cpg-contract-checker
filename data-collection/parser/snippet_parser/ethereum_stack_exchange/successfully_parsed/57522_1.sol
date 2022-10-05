

pragma solidity ^0.4.0;

contract exercise {

uint public balance; 
string name= "Sara" ;
int[] public nums=[1,2,3];

function setBalance(uint x) public { 
    balance = x; 

}

function getBalance() public view returns (uint) {
    return balance;
}

function doubleBalance() public view returns (uint) { 
    return 2*balance; 

}

}
