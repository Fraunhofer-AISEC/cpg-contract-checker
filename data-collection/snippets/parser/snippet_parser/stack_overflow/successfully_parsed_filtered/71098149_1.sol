import "./StructInterface.sol";

contract RegisterPerson is StructInterface {

    mapping (uint => Person) persons;

    function addPerson (
        uint _personId,
        string memory _name,
        string memory _surname,
        uint _age
    ) external {

        persons[_personId].personId = _personId;
        persons[_personId].name = _name;
        persons[_personId].surname =_surname;
        persons[_personId].age = _age;
    }
}

