pragma solidity ^0.4.11;

contract BaseLookup {

  struct Lookup {
    uint id;
    bytes32 name;
  }

  mapping(uint => Lookup) lookupById;

  function setLookupById(uint id, bytes32 name) public returns(bool success) {
    Lookup memory lookup;
    lookup.id = id;
    lookup.name = name;
    lookupById[id] = lookup;
    return true;
  }

  function getLookupById(uint _id) public constant returns (uint, bytes32) {
    return (lookupById[_id].id, lookupById[_id].name);
  }
}

contract ClientLookup {

  BaseLookup b;

  function DerivedLookup(address baseLookupAddress) public {
    b = BaseLookup(baseLookupAddress);
  }

  struct Lookup {
    uint id;
    string name;
  }

  function set(uint id, bytes32 name) public returns(bool success) {
    return b.setLookupById(id, name);
  }

  function get(uint id) public view returns(uint  theId, bytes32 name) {
    (theId, name) = b.getLookupById(id);
    return (theId, name);
  }
}
