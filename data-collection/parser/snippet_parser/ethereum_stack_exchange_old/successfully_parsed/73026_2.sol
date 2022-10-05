pragma solidity >=0.4.22 <0.6.0;

contract Back {
    uint availableFunds;

    event Received(uint);

    function () external payable {
        uint received = msg.value;
        availableFunds += received;
        emit Received(received);
    }

    function total() public view returns (uint) {
        return address(this).balance;
    }
}


contract Front {
    Back public back;

    event Created(address);
    event Received(uint);

    constructor() public {
        back = new Back();
        emit Created(address(back));
    }

    function () external payable {
        emit Received(msg.value);
    }

    function forward() public payable {
        address(back).call.value(address(this).balance).gas(gasleft())("");
    }

    function total() public view returns (uint) {
        return address(this).balance;
    }
}
