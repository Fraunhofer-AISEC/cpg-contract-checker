pragma solidity ^0.4.18;

contract Hash {
  bytes32 comphash;

  struct hashstruct {   
    bytes32 fhash;
  }

  mapping (uint => hashstruct) hashstructs;
  uint[] public hashAccts;

  function setinstructor(uint _uint,string _fhash) public {
    var a = hashstructs[_uint];

    a.fhash = sha256(_fhash);  

    hashAccts.push(_uint) -1;              
  }

  function getInstructor(uint ins) view public returns (bytes32) {
    return (hashstructs[ins].fhash);
  }

  function count() view public returns (uint) {
    return hashAccts.length;
  }            
}
