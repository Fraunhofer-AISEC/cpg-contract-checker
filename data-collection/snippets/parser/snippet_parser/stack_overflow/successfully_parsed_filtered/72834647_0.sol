

pragma solidity ^0.8.0;

contract MyContract{

string value;
constructor() public   {
    value = "MyValue";
}
function get() public returns(string)  {
    return value;
}

function set(string memory _value) public  {
    value = _value;
}


}`
