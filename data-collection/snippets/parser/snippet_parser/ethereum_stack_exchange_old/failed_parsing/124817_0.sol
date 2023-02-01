contract Promoter is Owner{

    **PromoterToken public token;**
    uint public lastOwnership;
    uint public rate = 1000000; 
    **address payable public thisContract = payable(address(this));**
    struct Voter{
        bool isRegistered;
        bool hasVoted;
        uint votedFor;
    }
    mapping(address => Voter) Member;
    address[] whitelist;


    **constructor(){
        token = new PromoterToken(100000000000000000000000000, thisContract);
        lastOwnership = block.timestamp;
        setContractPromoter(address(this));
    }**
