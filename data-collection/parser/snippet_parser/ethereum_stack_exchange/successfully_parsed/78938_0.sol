contract C1 {

    uint x;

    function setX(uint _x) public {
        x = _x;
    }

    function getX() public view returns (uint) {
        return x;
    }
}
