import "./StructInterface.sol";
import "./RegisterPerson.sol";
import "./GetPerson.sol";
import "./FunctionsInterface.sol";

contract Main is StructInterface{

    address regPersonA;
    address getPersonA;

    Person myPersons;

    constructor (address _regPersonA, address _getPersonA) {
        regPersonA = _regPersonA;
        getPersonA = _getPersonA;
    }

    function registerPerson(
        uint _personId,
        string memory _name,
        string memory _surname,
        uint _age
    ) external {

        FunctionsInterface interf = FunctionsInterface(regPersonA);
        interf.addPerson(_personId, _name, _surname, _age);
    }


    function getPerson(
        uint _personId
    ) external view
    returns (uint personId, string memory name, string memory surname, uint age) 
    {

        FunctionsInterface interf = FunctionsInterface(getPersonA);
        return interf.askPerson(_personId);
    }
}
