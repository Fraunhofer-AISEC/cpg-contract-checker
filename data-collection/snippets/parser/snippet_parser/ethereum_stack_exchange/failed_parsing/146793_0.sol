struct Person {
   string name,
   uint256 age
}

Person[] private persons;

function getAllNames() view external returns(memory string[]) {
  String[] memory names = [];
  for (uint256 i=0; i<persons.length; i++) {
    names.push(persons[i].name);
  }
  return names;
}

function getAllPersons() view external returns(Person[]) {
  return persons;
}

