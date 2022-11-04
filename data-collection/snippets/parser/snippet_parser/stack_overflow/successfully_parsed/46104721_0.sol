pragma solidity ^0.4.0;

contract SimpleStorage {

uint public storedData=99;
mapping(string => uint)  balances;



function set(uint x) public returns (uint){

    storedData = x;
    return storedData;

}

function get() public constant returns (uint) {

    return storedData;

}

function multiply(uint a) returns(uint d) {
    return a * 7;
}

function setmapping(string key,uint value) returns(uint v)
{
     balances[key] = value;
     return balances[key];
}

function getmapping(string key) returns(uint v)
{
    return balances[key];
}

function kill()
{ 

}


}
