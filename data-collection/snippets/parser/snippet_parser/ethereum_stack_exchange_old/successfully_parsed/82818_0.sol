
contract school {
    address public owner;
    address[] public teachers;

    mapping(uint => Class) public classes;

    struct Class {
        uint id;
        address teacher;
        address[] pupils;
    }

    constructor() public{
        owner = msg.sender;
    }

    function addTeacher(address _address) public {
        require(msg.sender == owner);
        teachers.push(_address);
    }

    function addClass(address _teacher, address[] memory _pupils) public {
        require(msg.sender == teachers);
        classes[1] = Class(1, _teacher, _pupils);
    }

}```
