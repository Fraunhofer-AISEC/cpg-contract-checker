contract Object {

    string name;
    function Object(String _name) {
        name = _name
    }
}

contract ObjectFactory {
    function createObject(string name) returns (address objectAddress) {
        return address(new Object(name));
    }
}
