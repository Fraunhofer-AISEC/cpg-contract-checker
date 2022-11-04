contract Sender {

    function() payable{

    }

    function sendTo(address receiverAddr) payable {
        var receiver = Receiver(receiverAddr);
        receiver.payMe.value(msg.value)();
    }
}

contract Receiver {
    bool public received;

    function() payable{

    }

    function payMe() payable returns(bool success) {
        received = true;
        return true;
    }
}
