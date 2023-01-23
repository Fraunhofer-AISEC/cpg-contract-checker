contract SimpleAuction {

    address payable public beneficiary;
    address payable public buyer;
    address payable public seller;

 .....

constructor(
        
        address payable _seller
        
    ) public {
        beneficiary = payable(address(this));
        buyer = payable(highestBidder);
        seller = _seller;
        state = State.await_payment;
        
    }
