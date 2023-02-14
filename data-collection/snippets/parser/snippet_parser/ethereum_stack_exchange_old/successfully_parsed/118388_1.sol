pragma solidity ^0.7.0;
pragma experimental ABIEncoderV2; 

contract DoubleEscrowTrade {
    uint256 private locked = 2; 
    uint256 public value=0;  
    uint256 public bidItemValue=0;  
    bool public openForBid = false;  
    string public posterItemName;
    string public whoInitDispute;
    uint256 public posterItemID;
    string public bidderItemName; 
    uint256 public bidderItemID;
    mapping (address=>address) public bidItemAddress; 
    mapping (address=>uint256) public bidItemID;
    mapping (address=>uint256) public bidValue;
    mapping (address=>string) public bidItemName;
    uint256 public howManyBidItem=0;
    address payable public poster;
    address payable public bidder;
    bool public delisted = false;
    bool public posterDispute = false;
    bool public bidderDispute = false;
    bool public posterShipped = false;
    bool public bidderShipped = false;
    uint256 public posterReceiveProdTime = 0;
    uint256 public bidderReceiveProdTime = 0;
    uint256 public posterReceiveReturnTime = 0;
    uint256 public bidderReceiveReturnTime = 0;
    uint256 public posterAcceptBidTime = 0;
    uint256 public posterEscrowBalance = 0;
    uint256 public posterEscrowRefund = 0;
    uint256 public bidderEscrowBalance = 0;
    uint256 public bidderEscrowRefund = 0;
    uint256 public bidderShipProdTime = 0;
    uint256 public posterShipProdTime = 0;
    uint256 public posterDepositTime = 0;
    uint256 public bidderDepositTime = 0;
    uint256 public posterDisputeTime = 0;
    uint256 public bidderDisputeTime = 0;
    uint256 public posterDelistTime = 0;
    uint256 private graceDay = 14;
    uint256 private dayInSecond = 24*3600;
    enum State { ForTrade, PosterAcceptBid, PosterEscrowDeposited, BidderEscrowDeposited, PosterDelisted, BidderCancelled, BidderShipped, PosterShipped, 
    InDispute, Complete, PosterReceiveProduct, PosterReceiveReturn, BidderReceiveProduct, BidderReceiveReturn }
    State public state;
}