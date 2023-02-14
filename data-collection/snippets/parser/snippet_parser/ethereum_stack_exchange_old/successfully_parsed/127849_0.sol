contract DealingContract {
    
    
    address payable public dealer;  

    
    address[] public participants;

    
    uint dealerOffer_wei;

    
    constructor() {
        dealer = payable(msg.sender);

        dealerOffer_wei = 0;
    }

    function join() public {
        participants.push(msg.sender);
    }

    function takePayment() public {
        require(msg.sender != dealer, "Only a participant can take payments!");
        require(dealerOffer_wei != 0, "There is no payment offer yet!");

        
    }

    function makeOffer(uint offer_wei) public {
        require(msg.sender == dealer, "Only the dealer can make offers!");

        dealerOffer_wei = offer_wei;
    }
}
