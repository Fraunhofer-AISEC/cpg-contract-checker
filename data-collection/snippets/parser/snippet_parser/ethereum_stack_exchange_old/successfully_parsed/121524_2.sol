

pragma solidity >=0.7.0 <0.9.0;

import "./MyInterface.sol";
import "./RegisterPerson.sol";
import "./GetPerson.sol";

contract PCore is MyInterface{

    address regPersonA;
    address getPersonA;

    constructor(Person memory _myPersons) {
        RegisterPerson _registerPerson = new RegisterPerson(_myPersons);
        GetPerson _getPerson = new GetPerson(_myPersons);
        regPersonA = address(_registerPerson);
        getPersonA = address(_getPerson);
        super;
    }

    function registerPerson(
        uint _personId,
        string memory _name,
        string memory _surname,
        uint _age
    ) public {
        RegisterPerson _registerPerson = RegisterPerson(regPersonA);

        _registerPerson.addPerson(_personId, _name, _surname, _age);
    }

    function getPerson(
        uint _personId
    ) public view
    returns (uint personId, string memory name, string memory surname, uint age) 
    {
        GetPerson _getPerson = GetPerson(getPersonA);

        (personId, name, surname, age) = _getPerson.askPerson(_personId);
        return (personId, name, surname, age);
    }

}
