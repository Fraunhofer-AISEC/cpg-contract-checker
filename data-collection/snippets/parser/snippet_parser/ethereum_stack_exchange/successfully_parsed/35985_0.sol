contract Person {
    uint public age;
    uint public weight;

    function Person(uint _age, uint _weight) public {
        age = _age;
        weight = _weight;
    }
}

contract PersonHolder {

    address[] public people; 

    function addPerson(uint age, uint weight) public {
        people.push(new Person(age, weight));
    }

    function getPerson(uint index) public view returns (Person) {
        require(people.length > index);

        return Person(people[index]);
    }
}
