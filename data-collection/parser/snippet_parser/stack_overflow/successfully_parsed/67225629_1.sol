function confirmPayment() buyerOnly inState(State.AWAITING_PAYMENT) payable {
    currentState = State.AWAITING_DELIVERY;  
}
    
function confirmDelivery() buyerOnly inState(State.AWAITING_DELIVERY) {
    seller.send(this.balance);
    currentState = State.COMPLETE;  
}
