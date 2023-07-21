contract ContractA {
    struct Person {
        string name;
    }

    Person[] public persons;

    function createPerson(string memory _name) public {
        persons.push(Person(_name));
    }
}

