contract Mutex {
bool locked;
modifier noReentrancy() {
    require(!locked);
    locked = true;
    _;
    locked = false;
}





function f() noReentrancy returns (uint) {
    require(msg.sender.call());
    return 7;
}
}