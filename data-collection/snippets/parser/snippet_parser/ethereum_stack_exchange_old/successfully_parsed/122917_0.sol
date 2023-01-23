pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

contract Auction {
    using SafeMath for uint256;
    uint256 public endTime; 
    uint256 public startTime; 
    uint public maxBid; 
    address public maxBidder; 
    address public creator; 
    Bid[] public bids; 
    uint public tokenId; 
    bool public isCancelled; 
    bool public isDirectBuy; 
    uint public minIncrement; 
    uint public directBuyPrice; 
    uint public startPrice; 
    address public nftAddress;  
    IERC721 _nft; 

    enum AuctionState { 
        OPEN,
        CANCELLED,
        ENDED,
        DIRECT_BUY
    }

    struct Bid { 
        address sender;
        uint256 bid;
    }

    
    constructor(address _creator,uint _endTime,uint _minIncrement,uint _directBuyPrice, uint _startPrice,address _nftAddress,uint _tokenId){
        creator = _creator; 
        endTime = block.timestamp +  _endTime; 
        startTime = block.timestamp; 
        minIncrement = _minIncrement; 
        directBuyPrice = _directBuyPrice; 
        startPrice = _startPrice; 
        _nft = IERC721(_nftAddress); 
        nftAddress = _nftAddress;
        tokenId = _tokenId; 
        maxBidder = _creator; 
    }

    
    function allBids()
        external
        view
        returns (address[] memory, uint256[] memory)
    {
        address[] memory addrs = new address[](bids.length);
        uint256[] memory bidPrice = new uint256[](bids.length);
        for (uint256 i = 0; i < bids.length; i++) {
            addrs[i] = bids[i].sender;
            bidPrice[i] = bids[i].bid;
        }
        return (addrs, bidPrice);
    }


    
    function placeBid() payable external returns(bool){
        require(msg.sender != creator); 
        require(getAuctionState() == AuctionState.OPEN); 
        require(msg.value > startPrice); 
        require(msg.value > maxBid + minIncrement); 

        address lastHightestBidder = maxBidder; 
        uint256 lastHighestBid = maxBid; 
        maxBid = msg.value; 
        maxBidder = msg.sender; 
        if(msg.value >= directBuyPrice){ 
            isDirectBuy = true; 
        }
        bids.push(Bid(msg.sender,msg.value)); 

        if(lastHighestBid != 0){ 
            address(uint160(lastHightestBidder)).transfer(lastHighestBid); 
        }
    
        emit NewBid(msg.sender,msg.value); 
        
        return true; 
    }

    
    function withdrawToken() external returns(bool){
        require(getAuctionState() == AuctionState.ENDED || getAuctionState() == AuctionState.DIRECT_BUY); 
        require(msg.sender == maxBidder); 
        _nft.transferFrom(address(this), maxBidder, tokenId); 
        emit WithdrawToken(maxBidder); 
    }

    
    function withdrawFunds() external returns(bool){ 
        require(getAuctionState() == AuctionState.ENDED || getAuctionState() == AuctionState.DIRECT_BUY); 
        require(msg.sender == creator); 
        address(uint160(creator)).transfer(maxBid); 
        emit WithdrawFunds(msg.sender,maxBid); 
    } 

    function cancelAuction() external returns(bool){ 
        require(msg.sender == creator); 
        require(getAuctionState() == AuctionState.OPEN); 
        require(maxBid == 0); 
        isCancelled = true; 
        _nft.transferFrom(address(this), creator, tokenId); 
        emit AuctionCanceled(); 
        return true;
    } 

    
    function getAuctionState() public view returns(AuctionState) {
        if(isCancelled) return AuctionState.CANCELLED; 
        if(isDirectBuy) return AuctionState.DIRECT_BUY; 
        if(block.timestamp >= endTime) return AuctionState.ENDED; 
        return AuctionState.OPEN; 
    } 

    event NewBid(address bidder, uint bid); 
    event WithdrawToken(address withdrawer); 
    event WithdrawFunds(address withdrawer, uint256 amount); 
    event AuctionCanceled(); 


    
}
