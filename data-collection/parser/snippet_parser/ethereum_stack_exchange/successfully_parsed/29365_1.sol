pragma solidity ^0.4.19;

contract tester{

struct Person
{
    string name;
    uint age;
}

function getSome() public returns (Person a)
{
    Person memory p;
    p.name = "kashish";
    p.age =20;
    return p;
}

function wantSome() public returns (string,uint)
{
     Person memory p2 =getSome();
     return (p2.name,p2.age); 
}
}
