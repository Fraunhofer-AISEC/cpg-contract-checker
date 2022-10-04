pragma solidity 0.7.5;

contract dogs{

    struct Person{
        uint age;
        string name;
    }
    Person[]people;
    function addNewPerson(uint _age, string memory _name)public {
        Person memory newPerson = Person(_age, _name);
        people.push(newPerson);

    }
    function getPerson(uint _index)public view returns(uint, string memory){
        Person memory personToReturn = people[_index];
        return(personToReturn.age, personToReturn.name);
    }


    function update(uint _index) public view returns(uint, string memory){
        Person memory updatePerson = people[_index];
    return(updatePerson.age, updatePerson.name);
    }


    function destory(uint _index)public{
        delete people[_index];

    }
}
