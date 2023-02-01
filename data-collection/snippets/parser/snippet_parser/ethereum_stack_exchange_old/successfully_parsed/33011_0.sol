pragma solidity ^0.4.11;

contract BaseLookup {

    address owner;
    function BaseLookup() { owner = msg.sender; }

    struct Lookup {
        uint id;
        string name;
    }

    mapping(uint => Lookup) lookupById;

    function getLookupById(uint _id) public constant returns (uint, string) {
        return (lookupById[_id].id, lookupById[_id].name);
    }
}

contract DerivedLookup is BaseLookup {

    function add(uint _id, string _name) public {
        Lookup memory newLookup;
        newLookup.id = _id;
        newLookup.name = _name;

        lookupById[newLookup.id] = newLookup;
    }
}
