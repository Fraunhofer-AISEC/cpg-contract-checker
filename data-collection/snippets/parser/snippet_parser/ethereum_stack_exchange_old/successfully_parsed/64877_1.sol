pragma solidity 0.5.2;

contract Destructor {

    address payable owner;

    constructor() public {
        owner = msg.sender;
    }

    function done() public {
        selfdestruct(owner);
    }
}

contract Test {

    uint public bla;

    function test(address dtor) public returns(bool) {
        Destructor(dtor).done();
        bla += 42;
        return true;
    }
}
