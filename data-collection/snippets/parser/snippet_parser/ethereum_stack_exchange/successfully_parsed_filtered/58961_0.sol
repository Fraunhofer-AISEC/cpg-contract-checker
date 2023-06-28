pragma solidity ^0.4.25;

interface Regulator{
        function CheckValue(uint amount) external returns(bool);

    function loan() external returns(bool);
}
contract PracticeInheritance is Regulator{
    uint private value;

    constructor (uint amount) public{
        value +=amount;
    }
    function deposit(uint amount) public{
        value += amount;
    }
    function withdraw(uint amount) public{
        if (CheckValue(amount)){
            value -= amount;
        }

    }

    function balance() view public returns(uint){
        return value;
    }

     function CheckValue(uint amount)public returns(bool){
            return amount <= value;
        }
        function loan()public returns(bool){
            return value >=0;
        }
}


contract PracticeContract is PracticeInheritance(500){
    string private name;
    uint private age;

    function setName(string _name) public{
        name = _name;
    }

    function setAge(uint _age) public{
        age = _age;
    }
    function getName() public constant returns(string){
        return name;}

        function getAge() public constant returns(uint){
        return age;}


}
