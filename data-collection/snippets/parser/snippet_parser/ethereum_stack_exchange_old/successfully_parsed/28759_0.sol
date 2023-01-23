contract Sender {
    function() payable {
    }

    function sendTo(address receiverAddr) {
        var receiver = Receiver(receiverAddr);
        receiver.transfer(this.balance); 
    }
}

contract Receiver {
    bool public received;

    function() payable {
        received = true; 
    }
}
