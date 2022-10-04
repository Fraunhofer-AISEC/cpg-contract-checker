

pragma solidity ^0.7.0;

struct Person{
    address addr;
    string name;
    string surname;
}

struct Company{
    address addr;
    string name;
}


interface Interface{

    function addPerson(address addr, string memory name, string memory surname) external;
    
    function addCompany(address addr, string memory name) external;

    function getPerson() external view returns (address addr);

    function getCompany() external view returns (address addr);
}
    

library Lib{


    function addPerson(address addr, string memory name, string memory surname) public{
        addr = msg.sender;
        mapPerson[addr] = Person(name, surname, addr);
    }

    function addCompany(address addr, string memory name) public{
        addr = msg.sender;
        mapCompany[addr] = Company(addr, name);
    }     
}

contract Lab03 is Interface{

    Person p;
    Company c;

    mapping(address => Person) mapPerson;
    mapping(address => Company) mapCompany;

    function addPerson(address addr, string memory name, string memory surname) public override {
        Lib.addPerson(addr, name, surname);
        emit addPersonEvent(addr, name, surname);
    }

    function addCompany(address addr, string memory name) public override{
        Lib.addCompany(addr, name);
        emit addCompanyEvent(addr, name);
    }

    function getPerson() public override view returns (address addr) {
        return p.addr;
    }

    function getCompany() public override view returns (address addr) {
        return c.addr;
    }

    event addPersonEvent(address addr, string name, string surname);
    event addCompanyEvent(address addr, string name);
}
