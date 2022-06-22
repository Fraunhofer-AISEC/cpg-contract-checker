contract Thingy {
    uint public thing;

    function doubler(uint input) public view returns (uint) {
        thing = input * 2;
        return thing;
    }
}
