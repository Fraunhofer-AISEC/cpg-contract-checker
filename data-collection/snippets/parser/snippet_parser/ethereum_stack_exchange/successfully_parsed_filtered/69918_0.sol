pragma solidity ^0.4.24;
pragma experimental ABIEncoderV2;

contract MY_PERSONS {

    struct Person{
        string name;
        uint age;
    }

    Person[] private persons;

    constructor ( Person[] _persons ) public {
    
    for(uint i=0; i<_persons.length; i++)
        persons.push(_persons[i]);
    }

    function add_person(Person _person) public  {
        persons.push(_person);
    }

    function get_person(uint index) public view returns(Person) {
        require(index >=0 && index < persons.length);
        return persons[index];
    }

}
