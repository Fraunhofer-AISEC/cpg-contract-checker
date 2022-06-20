contract A {
    address owner;
    uint randomVariable;

    function A(uint _randomVariable) {
        owner = msg.sender;
        randomVariable = _randomVariable;
    }
}
contract B is A {
    address owner;
    uint randomVariable2;

    function B(uint _randomVariable2) {
        owner = msg.sender;
        randomVariable2 = _randomVariable2;
    }

    function changeOwner(address _newOwner) {
        owner = _newOwner;
    }
}
