contract Receiver {

    uint public tickets;

    function buyTicket() public payable {
            require(msg.value == 2 ether, "not enough ether");
            
            tickets++;
        }
}

contract Sender {

    Receiver public receiver;

    constructor(address payable _receiverAddress) payable {
        receiver = Receiver(_receiverAddress);
    }

    function getTicket() external payable {
        require(msg.value >= 2 ether, "Not sending enought");
        receiver.buyTicket{value: 2 ether}();
    }
}
