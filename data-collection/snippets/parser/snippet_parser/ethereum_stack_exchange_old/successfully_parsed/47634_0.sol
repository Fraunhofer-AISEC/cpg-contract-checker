contract HelloWorld {
    string name="TEST";
    uint number;

    function HelloWorld() {

    }

    function getName() returns (string) {
        return name;
    }

    function getNumber() returns (uint) {
        return number;
    }

    function setNumber(uint _number) {
        number = _number;
    }
}
