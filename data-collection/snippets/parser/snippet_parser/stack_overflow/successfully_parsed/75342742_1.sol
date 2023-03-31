pragma solidity ^0.8.0;

interface Receiver {

    function deposit() external payable returns(uint256);
}

contract sender {
    Receiver private receiver = Receiver(0x0fC5022f7B5c4Df39A836);

    function sendDeposit(uint256 _amount) public payable {
        receiver.deposit{value: _amount}();
    }


    receive() external payable {
         require(msg.value > 0, "You cannot send 0 ether");
    }

 }
