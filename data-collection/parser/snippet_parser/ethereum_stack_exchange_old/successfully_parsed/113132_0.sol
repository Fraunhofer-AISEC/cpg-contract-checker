
pragma solidity 0.8.9;

contract Example {

  struct Person {
      bytes32 name;
      uint256 age;
  }

  struct Doctor {
     Person person;
     bytes32 specialty;
     uint256 years_experience;
  }

  mapping (address => Doctor) mapAddrToDoc;

  function addDoctor(bytes32 name, uint256 age, bytes32 specialty, uint256 years_experience) public {
      Doctor memory doc = Doctor(Person(name, age), specialty, years_experience);
      mapAddrToDoc[msg.sender] = doc;
  }

  function getNameOfDoc(address addr) public view returns (bytes32){
      return mapAddrToDoc[addr].person.name;
  }
}
