enum State {AWAITING_PAYMENT, AWAITING_DELIVERY, COMPLETE, REFUNDED}
State public currentState;

modifier buyerOnly() { require (msg.sender == buyer || msg.sender == arbiter); _;}

modifier sellerOnly() { require (msg.sender == seller || msg.sender == arbiter); _;}

modifier inState (State expectedState) { require (currentState == expectedState); _;}

address public buyer;
address public seller;
address public arbiter;

constructor(address _buyer, address _seller, address _arbiter) public {
    buyer = _buyer;
    seller = _seller;
    arbiter = _arbiter;
}


function sendPayment()buyerOnly inState (State.AWAITING_PAYMENT)public payable {
    currentState == State.AWAITING_DELIVERY;
}

function confirmDelivery()buyerOnly inState (State.AWAITING_DELIVERY)public payable {
    seller.transfer(address(this).balance);
    currentState == State.COMPLETE;
}

function refundBuyer() sellerOnly inState (State.AWAITING_DELIVERY)public payable {
    seller.transfer(address(this).balance);
    currentState == State.REFUNDED;
}

}
