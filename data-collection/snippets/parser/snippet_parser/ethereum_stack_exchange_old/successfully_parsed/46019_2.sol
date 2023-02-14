contract One {
    uint256 public u;

    function setU(uint256 _u) public {
        u = _u;
    }
}

contract Other {
    One public myOne = new One();

    function doSomething() public {
        myOne.setU(123);
    }
}
