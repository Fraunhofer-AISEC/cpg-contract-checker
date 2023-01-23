function EscrowPayment(address _seller, address _judge) payable {
    buyer = msg.sender;
    seller = _seller;
    judge = _judge;
}
