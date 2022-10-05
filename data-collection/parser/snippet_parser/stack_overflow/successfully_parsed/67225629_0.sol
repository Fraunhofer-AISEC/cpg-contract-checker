pragma solidity ^0.4.21;

contract Escrow {
    
    enum State {AWAITING_PAYMENT, AWAITING_DELIVERY, COMPLETE}
    
    State public currentState;
    
    address public buyer;
    address public seller;
    
    modifier buyerOnly() { require(msg.sender == buyer); _; } 
    modifier inState(State expectedState) { require(currentState == expectedState); _; }
    
    constructor(address _buyer, address _seller) {
        buyer = _buyer;
        seller = _seller;
    }
    
    function confirmPayment() buyerOnly inState(State.AWAITING_PAYMENT) payable {
        currentState == State.AWAITING_DELIVERY;
    }
    
    function confirmDelivery() buyerOnly inState(State.AWAITING_DELIVERY) {
        seller.send(this.balance);
        currentState == State.COMPLETE;
        
    }
}
