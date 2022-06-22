pragma solidity 0.4.8;

contract X {

    address owner;
    uint amount;

    event test(address value);
    event trial(uint val);


    function X() {
        owner = msg.sender;
        test(msg.sender);
    }

    function invoke() payable {
        test(msg.sender);

        trial(amount);
        amount = amount + msg.value;

        trial(amount);
    }
}
