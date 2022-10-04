contract Helloworld {
    uint private simpleInt;

    function getValue() public view returns (uint) {
        return simpleInt;
    }
}
