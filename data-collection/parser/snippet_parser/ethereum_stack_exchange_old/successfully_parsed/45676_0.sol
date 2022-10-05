pragma solidity 0.4.19; 

contract Pizzeria {

    bool public isPizzaria;
    uint public param1;
    uint public param2;

    function Pizzeria(uint arg1, uint arg2) public {
        param1 = arg1;
        param2 = arg2;
    }

}

contract PizzeriaFactory {

    address[] public pizzeriaFactories;

    function createPizzeria(uint arg1, uint arg2) public returns(address newPizzeria) {
        Pizzeria p = new Pizzeria(arg1, arg2);
        pizzeriaFactories.push(address(p));
        return address(p);
    }

}
