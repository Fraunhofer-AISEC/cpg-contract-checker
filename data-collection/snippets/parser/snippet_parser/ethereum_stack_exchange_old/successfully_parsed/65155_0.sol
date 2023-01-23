pragma solidity ^0.4.24;

contract Auction {
    address public owner;
    uint public startBlock;
    uint public endBlock;
    string public ipfsHash;

    enum State { Started, Running, Ended, Canceled }
    State public auctionState;

    uint public highestBindingBid;
    address public highestBidder;
    uint bidIncrement;

    mapping(address => uint) public bids;

    constructor() payable public {
        owner = msg.sender;
        auctionState = State.Running;
        startBlock = block.number;
        endBlock = block.number + 40320;
        ipfsHash = "";
        bidIncrement = 10;
    }

    modifier notOwner() {
        require(msg.sender != owner);
        _;
    }

    modifier afterStart() {
        require(block.number >= startBlock);
        _;
    }

    modifier beforeEnd() {
        require(block.number <= endBlock);
        _;
    }

    function min(uint a, uint b) pure internal returns(uint) {
        if(a <= b) {
            return a;
        } else {
            return b;
        }
    }

    function placeBid() payable public notOwner afterStart beforeEnd returns(bool) {
        require(auctionState == State.Running);
        require(msg.value > 0.001 ether);

        uint currentBid = bids[msg.sender] + msg.value;

        require(currentBid > highestBindingBid);

        bids[msg.sender] = currentBid;

        if(currentBid < bids[highestBidder]) {
            highestBindingBid = min(currentBid + bidIncrement, bids[highestBidder]);
        } else {
            highestBindingBid = min(currentBid, bids[highestBidder] + bidIncrement);
            highestBidder = msg.sender;
        }
       return true; 
    }
}
