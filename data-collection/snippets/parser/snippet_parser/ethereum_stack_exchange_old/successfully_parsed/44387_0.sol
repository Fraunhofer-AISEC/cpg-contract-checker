pragma solidity ^0.4.0;

contract myHWSC
{
    string private name;
    uint private age;

    function setName (string newName)
    {
        name=newName;
    }

    function getName() returns (string)
    {
        return name;
    }

}
