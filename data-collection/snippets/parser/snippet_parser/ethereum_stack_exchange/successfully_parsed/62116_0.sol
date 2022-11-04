pragma solidity ^0.4.24;

contract Bank{
    uint private value;

    constructor(uint amount) public{
        value = amount;
    }
    function deposit(uint amount) public{
        value += amount;
    }

    function withdraw(uint amount) public{
        value -= amount;
    }

    function balance()view public returns (uint){
        return value;
    }
}

contract MyFirstContract is Bank(10){
    string private name;
    uint8 private age;

    function setName(string _name) public {
        name = _name;
    }

    function getName()view public returns(string){
        return name;
    }

    function setAge(uint8 _age) public{
        age = _age;
    }

    function getAge() view public returns (uint8){
        return age;
    }

}
