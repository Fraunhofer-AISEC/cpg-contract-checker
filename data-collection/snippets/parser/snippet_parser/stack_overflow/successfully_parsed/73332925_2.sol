
pragma solidity ^0.8.13;

contract SimpleAuction {
    
    
    
    address payable public beneficiary;
    address payable public buyer;
    address payable public seller;

    
    address public highestBidder;
    uint public highestBid;

    mapping(address => uint) TotalAmount;

       
    enum State{
         
        
        await_payment, await_delivery, complete 
    }
  
    
    State public state;
      
    
    modifier instate(State expected_state){
          
        require(state == expected_state);
        _;
    }
  
   
    modifier onlyBuyer(){
        require(msg.sender == buyer);
        _;
    }
  
    
    modifier onlySeller(){
        require(msg.sender == seller);
        _;
    }

    
    mapping(address => uint) public pendingReturns;

    
    bool ended;

    
    event HighestBidIncreased(address bidder, uint amount);
    event AuctionEnded(address winner, uint amount);

    
    
    
    

    
    
    
    constructor(
        
        address payable _seller
        
    ) public {
        beneficiary = payable(address(this));
        buyer = payable(highestBidder);
        seller = _seller;
        state = State.await_payment;
        
    }

    
    
    
    
    function bid() public payable {
        
        
        
        
        

        
        
        require(
            !ended,
            "Auction already ended."
        );

        
        
        require(
            msg.value > highestBid,
            "There already is a higher bid."
        );

        if (highestBid != 0) {
            
            
            
            
            
            pendingReturns[highestBidder] += highestBid;
        }
        highestBidder = msg.sender;
        highestBid = msg.value;
        emit HighestBidIncreased(msg.sender, msg.value);
    }

    
    function withdraw() public returns (bool) {
        uint amount = pendingReturns[msg.sender];
        if (amount > 0) {
            
            
            
            pendingReturns[msg.sender] = 0;

            if (!payable(msg.sender).send(amount)) {
                
                pendingReturns[msg.sender] = amount;
                return false;
            }
        }
        return true;
    }

    
    
    function auctionEnd() public payable  onlySeller  {
    
        
        
        require(!ended, "auctionEnd has already been called.");

        
        ended = true;
        emit AuctionEnded(highestBidder, highestBid);

        


        beneficiary.transfer(highestBid);
    }

        
    function confirm_payment() onlyBuyer instate(
      State.await_payment) public payable{
      
        state = State.await_delivery;
          
    }
      
    
    function confirm_Delivery() onlyBuyer instate(
      State.await_delivery) public{
          
        seller.transfer(beneficiary.balance);
        state = State.complete;
    }
  
    
    function ReturnPayment() onlySeller instate(
      State.await_delivery)public payable{
        
         
       buyer.transfer(beneficiary.balance);
    }
}
