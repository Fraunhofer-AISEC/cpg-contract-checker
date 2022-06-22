bytes32 person;

function registerPerson(address _person) public {
   bytes32 x;
   x = sha256(abi.encodePacked(_person));
   person = x;
}
