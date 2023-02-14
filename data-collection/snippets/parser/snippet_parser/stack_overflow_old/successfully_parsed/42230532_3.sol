contract ObjectFactory {
    Object public theObj;

    function createObject(string name) returns (address objectAddress) {
        theObj = address(new Object(name));
        return theObj;
    }
}
