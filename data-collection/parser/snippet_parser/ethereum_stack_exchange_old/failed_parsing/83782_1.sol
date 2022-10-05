contract SplitPot {
    ...

    bool private locked = false;

    function receive() external payable {
        require(!locked, "reentrancy attempted");
        locked = true;
        ... 
        locked = false;
    }
}
