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

contract MyFirstContract { 

    Bank b; 

    constructor(address bankAddress) public {
        b = Bank(bankAddress); 
    }

    

    function depositInBank(uint amount) public {
        b.deposit(amount);
    }

}
