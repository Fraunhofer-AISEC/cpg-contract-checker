

pragma solidity ^0.8.12;

struct account{
        string _name;
        uint _acc_id;
        uint balance;
    }     

contract My_acc{
    account public person;

    constructor(string memory name, uint acc_id, uint _balance){
        person._name = name;
        person._acc_id = acc_id;
        person.balance = _balance;
    }
}
