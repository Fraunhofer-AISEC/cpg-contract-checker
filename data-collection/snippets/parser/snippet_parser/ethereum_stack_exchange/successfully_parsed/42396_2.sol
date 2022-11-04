pragma solidity ^0.5.0;

contract HelloWorld
{
string hello = "Hello World";
function sayHello() public view returns (string memory)
{
    return hello;
}
}
