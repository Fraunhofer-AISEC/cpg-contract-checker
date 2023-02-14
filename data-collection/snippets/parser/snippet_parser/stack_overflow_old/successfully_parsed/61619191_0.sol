pragma solidity ^0.5.0;

contract Etender{


    
    address payable private owner;
    constructor()public{
        owner = msg.sender;
    }


    

    struct tender  {

        uint tenderId;
        string tenderName;
        string tenderSector;
        string tenderLocation;
        string open;
        string close;
        string tenderCategory;
        string prequalification;
        uint tenderValue;
        bool status;
    }
    uint tid ;
    mapping(uint =>tender) private tenders;


    


    struct bidder {
      uint organisationId;
      string organisationName;
      address add;
      string pan;
      string bidderType;
      string city;
      string state;
      uint postalCode;
      string companyCategory;
      string natureOfBusiness;
    }
    uint bid;

    mapping(uint =>bidder) private bidders;
    mapping(address =>bool) private isRegistered;
    mapping(address => mapping(uint =>bool) )private isBidded;
    mapping(address =>bool) private isVerified;
    mapping(address =>uint) private bidderId;

    

    struct win {
        address winner;
        uint bidAmount;
        uint tenderId;
    }

    mapping(uint =>win) private winner;


    

    struct allBidding {
        address bidder;
        uint bidAmount;
        uint tenderId;
    }
    uint biddingCount;
    mapping(uint =>allBidding) private allBiddings;

    

    function createTender(string memory _name , string memory _sector ,string memory _location , 
    string memory _open , string memory _close ,string memory _catagory ,string memory _prequalification,
    uint _value  ) public {

        tenders[tid].tenderId = tid;
        tenders[tid].tenderName = _name;
        tenders[tid].tenderSector = _sector;
        tenders[tid].tenderLocation = _location;
        tenders[tid].open = _open;
        tenders[tid].close = _close;
        tenders[tid].tenderCategory = _catagory;
        tenders[tid].prequalification = _prequalification ;
        tenders[tid].tenderValue = _value ;
        tenders[tid].status = true ;
        tid++;
    }


    


    function createBidder(string memory _name ,string memory _pan , string memory _type , 
    string memory _city, string memory _state , uint _postalcode , string memory _companyCatagory ,
    string memory _nature)  public {

        bidders[bid].organisationId = bid ;
        bidders[bid].organisationName = _name;
        bidders[bid].add = msg.sender;
        bidders[bid].pan = _pan;
        bidders[bid].bidderType = _type;
        bidders[bid].city = _city ;
        bidders[bid].state = _state ;
        bidders[bid].postalCode = _postalcode;
        bidders[bid].companyCategory = _companyCatagory;
        bidders[bid].natureOfBusiness = _nature;
        bid++;
        bidderId[msg.sender] = bid ;
        isRegistered[msg.sender] = true;
    }


    

    function addBid (uint _tid , uint _bidAmount ) public {

        if (winner[_tid].bidAmount == 0){
            winner[_tid].winner = msg.sender ;
            winner[_tid].bidAmount = _bidAmount;
            winner[_tid].tenderId = _tid;
        }
        else{
            if(winner[_tid].bidAmount > _bidAmount){
                winner[_tid].winner = msg.sender ;
                winner[_tid].bidAmount = _bidAmount;
                winner[_tid].tenderId = _tid;
            }
        }

        allBiddings[biddingCount].bidder = msg.sender;
        allBiddings[biddingCount].bidAmount = _bidAmount;
        allBiddings[biddingCount].tenderId = _tid;
        biddingCount++;
        isBidded[msg.sender][_tid] = true ;

    }

    

    function closeTender(uint _tid) public {
        tenders[_tid].status = false ;
    }


    
    function verifyBidder(address _bidder) public {
        isVerified[_bidder] = true ;
    }


    

    function isRegisteredBidder() view public returns(bool){
        return isRegistered[msg.sender];
    }

   

    function isVerifiedBidder() view public returns(bool){
        return isVerified[msg.sender];
    }


    

    function allTenderDetails (uint _tid) view public returns (uint,string memory,string memory,string memory,string memory,string memory,string memory,string memory,uint , bool){
        return(
            tenders[_tid].tenderId,
            tenders[_tid].tenderName,
            tenders[_tid].tenderSector,
            tenders[_tid].tenderLocation,
            tenders[_tid].open,
            tenders[_tid].close,
            tenders[_tid].tenderCategory,
            tenders[_tid].prequalification,
            tenders[_tid].tenderValue,
            tenders[_tid].status);
    }

     function totalTenderLength() view public returns(uint){
        return tid;
    }


    

    function allBidderDetails(uint _bid) view public returns (uint,string memory,address ,string memory,string memory,string memory,
    string memory,uint,string memory,string memory,bool){
        return(
          bidders[_bid].organisationId,
          bidders[_bid].organisationName,
          bidders[_bid].add,
          bidders[_bid].pan,
          bidders[_bid].bidderType,
          bidders[_bid].city,
          bidders[_bid].state,
          bidders[_bid].postalCode,
          bidders[_bid].companyCategory,
          bidders[_bid].natureOfBusiness,
          isVerified[bidders[_bid].add] );
    }

    function totalBidderLength() view public returns(uint){
        return bid;
    }

    

    function allBiddingDetails(uint _i) view public returns (address , uint ,uint){
        return (allBiddings[_i].bidder,allBiddings[_i].bidAmount,allBiddings[_i].tenderId);
    }

    function totalBiddingLength() view public returns(uint){
        return biddingCount;
    }


    

    function checkbiddedStatus(uint _tid) view public returns(bool){
        return isBidded[msg.sender][_tid];
    }

    

    function tenderStatus(uint _tid) view public returns(bool){
        return tenders[_tid].status;
    }


    
    function addToBid() view public returns(uint){
        return bidderId[msg.sender];
    }



} 

