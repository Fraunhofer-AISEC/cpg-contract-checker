
address Owner;

uint ClaimTime ; 
uint ClaimCheckTime ; 

uint StartUp = 1; 


uint Donations;

mapping(string => uint) numberOfClaims; 
mapping(string => mapping(uint => string)) detailsOfClaim; 

mapping(address => string) onePerAddress; 



struct claims {
    uint date;
    uint amount;
    bool claimed;
}


mapping(address => uint) LastChecked; 
mapping(address => mapping(string => claims)) Refundtracker;



function WhistleBlower() payable public {
    
    Donations += msg.value;

    
    

    
    ClaimTime = 0;
    ClaimCheckTime = 0;

    
    Owner = msg.sender;
    return();
}
modifier onlyOwner {
    require(msg.sender == Owner);
    _;
}

function makeClaim(string _hash, string _details) public payable {
    
    
    
    require(msg.value >= 500 finney);
    require(keccak256(_hash) != keccak256(""));
    require(keccak256(_details) != keccak256(""));


    
    uint _timeofclaim = block.number;
    var _refundtracker = Refundtracker[msg.sender][_hash];
    _refundtracker.date = _timeofclaim;
    
    _refundtracker.amount = msg.value;

    
    uint _index = numberOfClaims[_hash];


    
    detailsOfClaim[_hash][_index] = _details;

    
    numberOfClaims[_hash] += 1;

}
