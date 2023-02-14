contract Forwarder {
    address owner;
    constructor() {
        owner = msg.sender;
    }
    receive() external payable {
        (bool s,) = payable(owner).call{value: msg.value}(new bytes(0));
        require(s);
    }
}
