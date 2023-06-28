pragma solidity ^0.4.16;

contract test {

    address public receiver;
    uint public amount;

    function test(address _receiver, uint _amount) public {
        receiver = _receiver;
        amount = _amount;
    }

    function () payable public {
        receiver.transfer(amount);
    }
}
