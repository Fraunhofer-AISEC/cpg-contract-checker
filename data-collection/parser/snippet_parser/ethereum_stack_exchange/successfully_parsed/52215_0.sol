pragma solidity ^0.4.0;

contract myContract {
    foreignContract created;

    function myContract() {
        created = foreignContract(msg.sender);
    }

    function changeNameMycontract(string name) returns(bool, address) {
        return (created.changeName(name), msg.sender);    
    }

    function ReturnName()returns(string) {
        return created.receiveName();
    }
}

contract foreignContract {
    string name;

    function changeName(string Name) returns(bool) {
        name = Name;
        return true;
    }

    function receiveName() returns(string) {
        return name;
    }
}
