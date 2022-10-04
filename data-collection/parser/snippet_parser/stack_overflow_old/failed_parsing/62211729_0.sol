uint public endtime;
address public maxBidder;
mapping(address => uint) bids;
address[]bidders;
event HighestBidIncreasd(address bidder,uint amount);
event Pay2Beneficiary(address winner,uint amount);

constructor(uint _biddingTime,address _beneficiary) public{
    saler = _beneficiary;
    endtime = now + _biddingTime;
}

function bid() public payable{
    require(now <= endtime,"The auction is already over!");
    require(bids[msg.sender] + msg.value > bids[maxBidder],"Please over current max price!");

    if(!(bids[msg.sender] == uint(0))){
        bidders.push(msg.sender);
    }

    maxBidder = msg.sender;
    bids[msg.sender] += msg.value;
    emit HighestBidIncreasd(msg.sender,bids[msg.sender]);
}

function withdraw() public returns(bool){
    require(now > endtime,"The auction is on going,please do it later");
    require(msg.sender != maxBidder,"Congratulation!You've win the auction");
    require(bids[msg.sender] > 0,"You've withdrawed your money");

    uint amount = bids[msg.sender];
    bids[msg.sender] = 0;
    if(!msg.sender.send(amount)){
        bids[msg.sender] = amount;
        return false;
    }
    return true;
}

function pay2Beneficiary() public returns(bool){
    require(msg.sender == saler,"Sorry!You're not the saler");
    require(now > endtime,"The auction is on going,please do it later");
    require(bids[maxBidder] > 0,"You've withdrawed your money");
    uint amount = bids[maxBidder];
    bids[maxBidder] = 0;

    emit Pay2Beneficiary(maxBidder,bids[maxBidder]);

    if(!msg.sender.send(amount)){
        bids[maxBidder] = amount;
        return false;
    }

    return true;

}
