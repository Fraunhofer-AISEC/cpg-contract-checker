pragma solidity ^0.4.18;

contract EthProj {

    string fName;
    string age;

    event Message(string name, string age);

    function setMessage(string _fName, string _age) public {
        fName = _fName;
        age = _age;

        emit Message(_fName, _age);
    }

    function getName() public constant returns (string) {
        return (fName);
    }

    function getMessage() public constant returns (string) {
        return (age);
    }
}
