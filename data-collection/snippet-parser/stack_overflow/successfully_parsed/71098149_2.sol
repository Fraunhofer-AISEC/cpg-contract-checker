import "./StructInterface.sol";

contract GetPerson is StructInterface {
    mapping (uint => Person) persons;

    function askPerson(uint _personId) external view
    returns (uint personId, string memory name, string memory surname, uint age) {

        personId = persons[_personId].personId;
        name = persons[_personId].name;
        surname = persons[_personId].surname;
        age = persons[_personId].age;

        return (personId, name, surname, age);
    }
}
