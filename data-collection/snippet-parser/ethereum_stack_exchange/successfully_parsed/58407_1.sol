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
        bytes32 name;
        bytes32 subject;

    }

    mapping (address => Instructor) instructors;
    address[] public instructorAccts;

    event instructorInfo (

        bytes name,
        bytes subject,
        uint age

        );

    function setInstructor(address _address, uint _age, bytes32 _subject, bytes32 _name) public onlyOwner {

        instructors[_address].subject = _subject;
        instructors[_address].name = _name;
        instructors[_address].age = _age;
    }

    function getInstructor(address _address)view public returns(bytes32, bytes32, uint) {
        return(instructors[_address].subject, instructors[_address].name, instructors[_address].age);
    }
}
