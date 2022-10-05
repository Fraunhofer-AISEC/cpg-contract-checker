pragma solidity ^0.4.11;

contract Dao {

    address public owner;

    function Dao() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require (msg.sender == owner);
        _;
    }

    function transferOwnership(address newOwner) onlyOwner {
        owner = newOwner;
    }

    struct Lookup {
        uint id;
        string name;
    }

    mapping(uint => Lookup) internal lookupById;

    function getLookupById(uint _id) public constant returns (uint, string) {
        return (lookupById[_id].id, lookupById[_id].name);
    }

    function add(uint _id, string _name) onlyOwner {

        Lookup memory newLookup;
        newLookup.id = _id;
        newLookup.name = _name;
        lookupById[_id] = newLookup;
    }
}

contract Service {

    Dao dao;

    function Service(address daoAddress) {
        dao = Dao(daoAddress);
    }

    function add(uint _id, string _name) {
        dao.add(_id, _name);
    }
}
