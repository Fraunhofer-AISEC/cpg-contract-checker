contract SimpleStorage {
    struct Person {
        string name;
        int age;
    }
    
    mapping(string => Person) private nameLookup;

    function addPerson(string memory name, int age) public {
        nameLookup[name] = Person(name, age);
    }

    function getPerson(string memory name) public view returns(Person memory ret) {
        ret = nameLookup[name];
    }   
}
