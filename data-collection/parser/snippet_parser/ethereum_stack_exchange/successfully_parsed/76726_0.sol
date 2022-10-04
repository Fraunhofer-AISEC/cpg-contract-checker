pragma solidity ^0.5.11; 

contract Master {

    address Pi_C_Owner;
    address payable public NewAuctionPayable;   

    constructor() public {
        Pi_C_Owner = msg.sender;
    }

    function checkBalance() public view returns(uint) { 
        require(msg.sender == Pi_C_Owner,"Insufficient permission");
        return(address(this).balance);
    }

    function increaseBalance() public payable {
        require(msg.sender == Pi_C_Owner,"Insufficient permission");
    }

    function createAuction(address _Destination, uint _WTP, uint _BiddingTime) public returns(address) {    
        require(_WTP > 0,"Willingness to pay has to exceed 0.");
        address NewAuction = address (new Auction(_Destination, _WTP, _BiddingTime, address(this)));
        NewAuctionPayable = address(uint160(NewAuction));
        NewAuctionPayable.transfer(_WTP);
        return(NewAuctionPayable);
    } 

    function Test() public returns(uint) {
        
    }

    function() external payable {
    }
}

contract Auction {

    bool Ended;
    uint WTP;
    uint public a8_AuctionEndTime;
    uint public a7_SafetyDeposit;
    uint public a6_LowestBid;
    address public a5_Destination;
    address payable MasterPayable;
    address payable LowestBidder;
    address payable Payee;

    struct Participant {
        bool biddingright;
        uint amount;
    }

    mapping(address => Participant) participants;
    address payable[] depositor;

    constructor(address _Destination, uint _WTP, uint _BiddingTime, address payable _Master) public {
        a5_Destination = _Destination;
        WTP = _WTP;
        a7_SafetyDeposit = _WTP/2;
        a6_LowestBid = _WTP;
        a8_AuctionEndTime = now + _BiddingTime;
        MasterPayable = _Master;
        Ended = false;
    }

    function a1_getRights() public payable { 
        require(now <= a8_AuctionEndTime,"Auction already ended.");
        require(msg.value >= a7_SafetyDeposit);
        require(participants[msg.sender].biddingright == false,"Safety deposit already payed.");
        participants[msg.sender].biddingright = true;
        participants[msg.sender].amount = msg.value;
        depositor.push(msg.sender);
    }

    function a2_placeBid(uint Bid) public {                                         
        require(now <= a8_AuctionEndTime,"Auction already ended.");
        require(Bid < a6_LowestBid,"There already is a lower bid.");
        require(participants[msg.sender].biddingright == true,"Please note safety deposit.");
        LowestBidder = msg.sender;
        a6_LowestBid = Bid;
    }

    function a3_AuctionEnd() public {
        require(now >= a8_AuctionEndTime,"Auction not yet ended.");
        require(Ended == false,"Auction end has already been called.");
        Ended = true;
        MasterPayable.transfer(WTP-a6_LowestBid);                          
        for(uint i=0; i<depositor.length; i++) {
            Payee = depositor[i];
            if(Payee != LowestBidder) {
                Payee.transfer(participants[Payee].amount);         
            }
        }
    }

    function() external payable {
    }
}
