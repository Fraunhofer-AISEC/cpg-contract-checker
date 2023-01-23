contract One {
    uint256 public u;
}

contract Other {
    One public myOne = new One();

    function doSomething() public {
        myOne.u = 123; 
    }
}
