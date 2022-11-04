function EscrowPayment(address _seller, address _judge) payable {
    gasLimit = msg.gas; 
    value = msg.value; 
    gasPrice = tx.gasprice;
    buyer = msg.sender;
    seller = _seller;
    judge = _judge;
}
