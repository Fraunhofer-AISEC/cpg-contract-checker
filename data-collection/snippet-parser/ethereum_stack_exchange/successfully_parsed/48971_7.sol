contract Mutex {
    bool locked;
    modifier noReentrancy() {
        require(
            !locked,
            "Reentrant call."
        );
        locked = true;
        _;
        locked = false;
    }





function f() public noReentrancy returns (uint) {
    (bool success,) = msg.sender.call("");
    require(success);
    return 7;
}
}