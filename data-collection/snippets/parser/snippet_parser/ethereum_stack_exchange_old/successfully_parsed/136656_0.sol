contract WillThrow {
    function aFunction() public pure {
        require(false, "Error message");
    }
}
