pragma solidity ^0.5.0; 


 interface RegisterSC{
      
        function isBuyerExist(address addr) external view returns (bool); 
    }
    
contract PlasticBale{
    

    address[] public plasticBale; 
    address payable[] public contributors; 
     address payable[] public tempArray; 
     uint public contribution;  
   
 
      bool public isOpen; 
      uint public highestBid; 
      address payable public highestBidder; 
      uint public startTime; 
      uint public endTime; 

  
  struct buyer{
      bool isExist; 
      uint placedBids; 
      uint deposit; 
  }
  
  
  mapping(address=>buyer) bidder; 
  
  
   address payable public auctionOwner;
   
   
   uint totalBidders; 
    
    constructor(address[] memory _plasticBale, address payable[] memory _contributors, address payable seller ) public {
      plasticBale = _plasticBale; 
      contributors = _contributors; 
      auctionOwner = seller; 
      totalBidders = 0; 
  }  
    
    
    modifier onlyOwner{
        require(msg.sender == auctionOwner, "Auction owner is not authorized"); 
        _; 
    }
    
    modifier onlyBidder(address registerContractAddr){
        RegisterSC registerSC = RegisterSC(registerContractAddr); 
        require(registerSC.isBuyerExist(msg.sender), "Bidder is not registered"); 
        _;                                                                        
    }
    
    event bidderRegistered (address indexed baleAddress, address indexed bidderAddress); 
    event auctionStarted (address indexed baleAddress, uint startingAmount, uint closingTime); 
    event bidPlaced(address indexed baleAddress, address indexed biddeAddress, uint amount);
    event bidderExited(address indexed baleAddress, address indexed bidderAddress); 
    event auctionEnded (address indexed baleAddress,address highestBidder, uint highestBid , uint closingTime); 
    event recyclerRewarded(address indexed recycler, uint etherReward);
    event updateStatusBuyer(address buyer, address indexed plasticBottleAddress, string status, uint time); 
    

    function startAuction(uint closingTime, uint startPrice) onlyOwner payable public {
        require(isOpen == false, 
        "Auction is already open."); 
        require( closingTime > now, 
        "Auction time can only be set in future.");
        isOpen = true; 
        highestBid = startPrice; 
        highestBidder = address(0); 
        startTime = now; 
        endTime = closingTime;
        emit auctionStarted(address(this), startPrice, closingTime); 
    }
    
    
    
     function addBidder(address registerContractAddr, address bidderAddr) onlyBidder (registerContractAddr) public {
    require(bidder[bidderAddr].isExist == false, 
    "Bidder already joined the Auction.");
    totalBidders++; 
    bidder[bidderAddr] = buyer(true, 0, 0); 
    emit bidderRegistered(address(this),bidderAddr);
        
    }
    function exitAuction(address registerContractAddr) onlyBidder(registerContractAddr) public {
        require(bidder[msg.sender].placedBids == 0,
        "Buyer has placed a bid already."); 
        bidder[msg.sender] = buyer(false, 0 ,0); 
        totalBidders--; 
        emit bidderExited(address(this), msg.sender); 
    }
    
    function placeBid(address registerContractAddr, uint amount)  onlyBidder(registerContractAddr) payable public{
        require(bidder[msg.sender].isExist,
        "Buyer Address is not registered."); 
        require(isOpen,
        "Auction is not opened.");
        require(amount > highestBid, 
        "Place a higher bid."); 
        require(msg.value == amount, 
        "Insufficient Deposit."); 
        bidder[msg.sender].placedBids++; 
        bidder[msg.sender].deposit += msg.value; 
        highestBid = amount; 
        highestBidder= msg.sender; 
        emit bidPlaced(address(this), msg.sender, amount); 
        
    }
    
    
    
    
    function endAuction() onlyOwner public{
        
        require( isOpen, 
        "Auction is not avalible.");
        require(endTime < now, 
        "Auction duration is not up yet.");
        require(highestBidder != address(0),
        "No bids have been placed"); 
        
        isOpen = false; 
        
       
    
        
        (auctionOwner).transfer(address(this).balance/2); 
        
        

        uint contributionRate =0; 
        uint reward; 
        
        
        
        for(uint i=0; i < contributors.length; i++){
                uint j;
             for(j=0; j < i; j++)
                  if(contributors[i] == contributors[j])
                      break;
                if(i==j)
                tempArray.push(contributors[i]);
              }
        
        

        for(uint i=0; i < tempArray.length; i++){
            contribution=0;
             for(uint z=0; z < contributors.length; z++){
                  if(tempArray[i] == contributors[z])
                      contribution++;
             }
             contribution = contribution *100; 
             contributionRate = contribution / (plasticBale.length);
             reward = ((contributionRate * (address(this).balance/2))/ 100)+1;
             tempArray[i].transfer(reward); 
             rewardRecycler(tempArray[i], reward); 
    
        }
          
          
          for(uint i=0; i< plasticBale.length; i++)
          updateBottleStatus(highestBidder, plasticBale[i]); 
          
        emit auctionEnded(address(this), highestBidder, highestBid , now); 
    
    }
    
    function updateBottleStatus(address buyerAddress, address plasticBottleAddress) public {
        
        emit updateStatusBuyer(buyerAddress, plasticBottleAddress, "Purchased", now); 
    }
    
    function rewardRecycler(address recycler, uint reward) public {
        
        emit recyclerRewarded(recycler, reward);
    }
    
    function contractBalance() public view returns(uint){
        return address(this).balance;
    }
    
    
    
     function getTime()  public view returns (uint){
        return now + 2 minutes; 
    }
    
}

