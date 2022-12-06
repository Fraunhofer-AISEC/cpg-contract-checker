pragma solidity ^0.8.9;

contract Person{
    string public FirstName;
    string public LastName;
}

contract Family{
    Person[] public People;
}

contract FamilyManager{
    Family[] Families;

    function AddFamily(Person[] memory people) public {
        Family family = new Family();
        for(uint x; x < people.length; x++){
            family.People.push(people[x]);
        }
        Families.push(family);
    }

    function GetFamilies() public view returns (Family[] memory){
        return Families;
    }
}
