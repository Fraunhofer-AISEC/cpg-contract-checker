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
        require(msg.sender.call());
        return 7;
    }
}
