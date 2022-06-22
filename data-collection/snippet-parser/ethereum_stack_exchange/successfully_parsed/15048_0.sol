pragma solidity ^0.4.0;

contract C{
  struct Person{
    string name;
    mapping(address=>int) map;
    string[] nickNames;
    int age;
  }

  function init() constant returns (string, int){
    string[] memory nickNames = new string[](1);
    nickNames[0] = "cat1099";

    Person memory p = Person("Jack", nickNames, 23);

    return (p.name, p.age);
  }
}
