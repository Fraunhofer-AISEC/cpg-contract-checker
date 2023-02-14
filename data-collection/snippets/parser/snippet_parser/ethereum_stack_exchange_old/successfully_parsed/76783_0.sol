pragma solidity ^0.5.11; 
pragma experimental ABIEncoderV2;



contract PI_Container {

    Auction auction;
    Tracking tracking;

    address NewAuction;
    address Pi_C_Owner;
    address public NewTracking;
    address payable public NewAuctionPayable;


    constructor() public {
        NewTracking = address (new Tracking(msg.sender));
        tracking = Tracking(NewTracking);
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
        require(_BiddingTime > 0,"Bidding time has to exceed 0.");
        NewAuction = address (new Auction(tracking.RecentAddress(), _Destination, _WTP, _BiddingTime, address(this)));
        NewAuctionPayable = address(uint160(NewAuction));
        auction = Auction(NewAuctionPayable);
        NewAuctionPayable.transfer(_WTP);
        return(NewAuctionPayable);
    }

    function ProofOfDelivery() public {
        
        auction.a4_Payment();
    }

    function() external payable {
    }
}

contract Tracking {

    uint RecordId;
    uint public RecordCount;
    address public RecentAddress;

    struct Record{
        uint id;
        address adr;            
        string pifunction;
        string coordinates;
        uint time;
    }    

    mapping(uint => Record) records;

    constructor(address _Source) public {
        RecentAddress = _Source;
    }

    function a_addRecord(string memory PI_Function, string memory Coordinates) public {
        records[RecordId] = Record(RecordId, msg.sender, PI_Function, Coordinates, now);
        RecordId++;
        RecordCount = RecordId;
        RecentAddress = msg.sender;
    }

    function b_getRecord(uint RecordID) public view returns(Record memory) {
        return records[RecordID];
    }

    function c_getAddresses() public view returns(address[] memory) {
        address[] memory adr = new address[](RecordId);
        for(uint i = 0; i < RecordId; i++) {
            Record storage record = records[i];
            adr[i] = record.adr;
        }
        return(adr);
    }

    function d_getPI_Functions() public view returns(string[] memory) {
        string[] memory pifunction = new string[](RecordId);
        for(uint i = 0; i < RecordId; i++) {
            Record storage record = records[i];
            pifunction[i] = record.pifunction;
        }
        return(pifunction);
    }

    function e_getCoordinates() public view returns(string[] memory) {
        string[] memory coordinates = new string[](RecordId);
        for(uint i = 0; i < RecordId; i++) {
            Record storage record = records[i];
            coordinates[i] = record.coordinates;
        }
        return(coordinates);
    }   
}

contract Auction {

    bool Ended;
    uint WTP;
    uint public LowestBid;
    uint public SafetyDeposit;
    uint public AuctionEndTime;
    address public Departure;
    address public Destination;
    address payable MasterPayable;
    address payable LowestBidder;
    address payable Payee;

    struct Participant {
        bool biddingright;
        uint amount;
    }

    mapping(address => Participant) participants;
    address payable[] depositor;


    constructor(address _Departure, address _Destination, uint _WTP, uint _BiddingTime, address payable _Master) public {
        Departure = _Departure;
        Destination = _Destination;
        WTP = _WTP;
        SafetyDeposit = _WTP/2;
        LowestBid = _WTP;
        AuctionEndTime = now + _BiddingTime;
        MasterPayable = _Master;
        Ended = false;
    }

    function a1_getRights() public payable { 
        require(now <= AuctionEndTime,"Auction already ended.");
        require(msg.value >= SafetyDeposit,"Value has to atleast amount to 'safety deposit'.");
        require(participants[msg.sender].biddingright == false,"Safety deposit already payed.");
        participants[msg.sender].biddingright = true;
        participants[msg.sender].amount = msg.value;
        depositor.push(msg.sender);
    }

    function a2_placeBid(uint Bid) public {                                         
        require(now <= AuctionEndTime,"Auction already ended.");
        require(Bid < LowestBid,"There already is a lower bid.");
        require(participants[msg.sender].biddingright == true,"Please note safety deposit.");
        LowestBidder = msg.sender;
        LowestBid = Bid;
    }

    function a3_AuctionEnd() public {
        require(now >= AuctionEndTime,"Auction not yet ended.");
        require(Ended == false,"Auction end has already been called.");
        Ended = true;
        MasterPayable.transfer(WTP-LowestBid);                          
        for(uint i=0; i<depositor.length; i++) {
            Payee = depositor[i];
            if(Payee != LowestBidder) {
                Payee.transfer(participants[Payee].amount);         
            }
        }
    }

    function a4_Payment() public {
        require(Ended == true,"Destination not yet reached.");
        selfdestruct(LowestBidder);
    }

    function() external payable {
    }
}
