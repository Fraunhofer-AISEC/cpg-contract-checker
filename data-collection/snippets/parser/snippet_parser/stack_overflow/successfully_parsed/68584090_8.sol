
pragma solidity ^0.8.0;

contract Project {

struct Person {
    string name;
    string description;
}

Person[] public people;
uint256 public peopleCount;

constructor(){
    peopleCount = 0;
}

function addPerson(string memory name, string memory description) public returns (Person memory) {
    
    require(bytes(name).length > 0, "Error: Dont leave the name empty!");
    require(bytes(description).length > 0, "Error: Dont leave the description empty!");

    
    peopleCount++;
    
    
    Person memory p = Person(name, description);
    
    
    people[peopleCount] = p;
    
    
    return p;
}
}