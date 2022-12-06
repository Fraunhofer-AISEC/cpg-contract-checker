pragma solidity 0.8.1;

interface Types {
  struct Person {
    uint age;
    string name;
  }    
}

interface IOriginal is Types {
  function persons(bytes32) external view returns(uint, string memory);
}

contract Original is IOriginal {
  mapping(bytes32 => Person) public override persons;
}

contract SecondContract is Types {
  IOriginal original;

  constructor(address ofOriginalContract) {
    original = IOriginal(ofOriginalContract);
  }

  function processData(bytes32 someBytes) public {
    (uint age, string memory name) = original.persons(someBytes);
    
  }
}
