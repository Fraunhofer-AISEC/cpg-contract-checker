

pragma solidity >=0.4.22 <0.9.0;

contract CryptoFirst {
uint public count = 0;

struct Contact {
    uint id;
    string name;
    string phone;
}

constructor() {
    createContact("myname", "phone-number");
}

mapping(uint256 => Contact) public contacts;

event ContactCreated(uint id, string name, string phone);

function createContact(string memory _name, string memory _phone) 
public {
    count ++;
    contacts[count] = Contact(count, _name, _phone);
    emit ContactCreated(count, _name, _phone);
}

function myFunction() public pure returns(uint256 myNumber, string 
memory myString) {
    return (23456, "Hello!%");
}
}
