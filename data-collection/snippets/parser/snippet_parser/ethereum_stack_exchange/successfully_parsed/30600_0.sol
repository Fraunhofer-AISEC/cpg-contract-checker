pragma solidity ^0.4.15;

contract MyStructExample {
    struct MyStruct {
        address addr;
        string description;
        bool completed;
    }

    address owner;
    mapping (address => mapping(string => MyStruct)) myStructs;

    
    function MyStructExample() {
        owner = msg.sender;
    }

    
    function setMyStruct(address _addr, string _description) {
        MyStruct storage myStruct;

        myStruct.addr = _addr;
        myStruct.description = _description;
        myStruct.completed = false;

        myStructs[myStruct.addr][myStruct.description] = myStruct;
    }

    
    function getMyStruct(address _addr, string _description) constant returns (address, string, bool) {
        MyStruct memory myStruct = myStructs[_addr][_description];
        return (myStruct.addr, myStruct.description, myStruct.completed);
    }

    
    function setCompleted(address _addr, string _description) onlyOwner returns (bool) {
        myStructs[_addr][_description].completed = true;

        return myStructs[_addr][_description].completed;
    }

    modifier onlyOwner() {
        assert(msg.sender != owner);
        _;
    }

    function kill() onlyOwner { 
        selfdestruct(owner);
    }
}
