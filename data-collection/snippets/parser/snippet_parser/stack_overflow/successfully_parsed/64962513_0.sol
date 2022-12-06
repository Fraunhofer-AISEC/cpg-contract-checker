
pragma solidity 0.6.6;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/math/SafeMath.sol";

contract AuctionBox{
    
    Auction[] public auctions; 
   
    function createAuction (
        string memory _title,
        uint _startPrice,
        string memory _description
        ) public {
        
        Auction newAuction = new Auction(msg.sender, _title, _startPrice, _description);
        
        auctions.push(newAuction);
    }
    
    function returnAllAuctions() public view returns(Auction[] memory){
        return auctions;
    }
}

contract Auction {
    
    using SafeMath for uint256;
    
    address payable private owner; 
    string title;
    uint startPrice;
    string description;

    enum State{Default, Running, Finalized}
    State public auctionState;

    uint public highestPrice;
    address payable public highestBidder;
    mapping(address => uint) public bids;
    
      
    
    constructor(
        address payable _owner,
        string memory _title,
        uint _startPrice,
        string memory _description
        
         
         
         
        
        ) public {
        
        owner = _owner;
        title = _title;
        startPrice = _startPrice;
        description = _description;
        auctionState = State.Running;
    }
    
    modifier notOwner(){
        require(msg.sender != owner);
        _;
    }
    
    
    function placeBid() public payable notOwner returns(bool) {
        
        require(auctionState == State.Running, "error: auctionState is not running");
        require(msg.value >= 0, "error: bid value is lower than 0");
        
        uint currentBid = bids[msg.sender].add(msg.value);
        
        require(currentBid > highestPrice);
        
        bids[msg.sender] = currentBid;
        
        highestPrice = currentBid;
        highestBidder = msg.sender;
        
        return true;
    }
    
    function finalizeAuction() public{
        
        require(msg.sender == owner || bids[msg.sender] > 0);
        
        address payable recipiant;
        uint value;
        
        
        if(msg.sender == owner){
            recipiant = owner;
            value = highestPrice;
        }
        
        else if (msg.sender == highestBidder){
            recipiant = highestBidder;
            value = 0;
        }
        
        else {
            recipiant = msg.sender;
            value = bids[msg.sender];
        }
        
        bids[msg.sender] = 0;
        recipiant.transfer(value);
        auctionState = State.Finalized;
    }
    
    
    function returnContent() public view returns(        
        string memory,
        uint,
        string memory,
        State
        ) {
        return (
            title,
            startPrice,
            description,
            auctionState
        );
    }
}
