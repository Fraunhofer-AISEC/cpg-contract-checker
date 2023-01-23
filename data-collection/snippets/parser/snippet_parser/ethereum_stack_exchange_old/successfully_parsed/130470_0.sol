pragma solidity ^0.8.15;

contract Works {
  string public thing;

  function setThing(string memory newValue) public {
    thing = newValue;
  }
}

contract AlsoWorks {
  mapping(bytes32 => string) public things;

  function setThing(bytes32 key, string memory newValue) public {
    things[key] = newValue;
  }
}

contract Fails {
  string public thing;

  function setThing(string memory newValue) public {
    string storage thingLocal = thing;
    thingLocal = newValue;
  }
}
