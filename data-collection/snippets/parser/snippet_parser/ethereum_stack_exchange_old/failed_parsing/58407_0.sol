pragma solidity ^0.4.23;

contract Owned {

    address owner;

    function owned() public {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

}

contract Edureka is Owned {

    struct Instructor {

        uint age;
        bytes name;
        bytes subject;

    }

    mapping (address => Instructor) instructors;
    address[] public instructorAccts;

    event instructorInfo (

        bytes name,
        bytes subject,
        uint age

        );

    function setInstructor(address _address, uint _age, bytes _subject, bytes _name) {

        **var instructor =instructors[_address];**

        instructor.subject = _subject;
        instructor.name = _name;
        instructor.age = _age;
    }

    function getInstructor()view public returns(address[]){

        return instructorAccts;
    }

    function getInstructor(address _address)view public returns(uint, bytes, bytes) {

        **return(instructors[_address].subject, instructors[_address].name, instructors[_address].age)**

    ;
    }


    function countInstructurs() view public returns(uint){

        **return instructors.length;**
    }


}
