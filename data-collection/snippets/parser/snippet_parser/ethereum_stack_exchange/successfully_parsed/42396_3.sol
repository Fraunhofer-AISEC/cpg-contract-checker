pragma solidity ^0.8.0;

contract HelloWorld
{
string hello = "Hello World";
function sayHello() public view returns ( string memory)
    {
        return hello;
    }
}
