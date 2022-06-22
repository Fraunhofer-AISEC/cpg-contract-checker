contract PersonStorage {
  struct Person {
    uint dateCreate;
    string name;
    string email;
    string phone;
  }

  mapping(bytes32 => Person) persons;

  function addPerson(string _name, string _email, string _phone) public {
    Person memory person;

    person.name = _name;
    person.email = _email;
    person.phone = _phone;

    persons[keccak256(person.email)] = person;
  }
  ...
}
