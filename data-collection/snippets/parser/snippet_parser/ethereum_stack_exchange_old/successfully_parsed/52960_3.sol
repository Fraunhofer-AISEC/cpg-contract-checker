contract B is A {
    address private owner;
    uint state;
    constructor() public {
        owner = msg.sender;
        state = 0;
    }
    function getOwner() internal returns(address) {
        return owner;
    }
    function performOperation() internal {
        state = state + 1;
    }
}
