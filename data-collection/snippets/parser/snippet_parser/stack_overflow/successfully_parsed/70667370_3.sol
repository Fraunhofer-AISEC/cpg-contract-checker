 contract SubDAO {

uint proposalNum;
address lender;
uint poolGap;
uint currentStake;
uint256 public DAOID;
MasterDAO master;
address stakeItem;
uint rate;
Dtoken public token;

mapping(address => Member) members;
mapping (uint => Proposal) public proposals;

string[] description;

event Transfrom(address, uint);

struct Member {
    address memberAddress;
    string nickName;
    bool alreadyExist;
}


struct Proposal {
    string description;
    address payable recipient;
    bool executed;
    uint proposalID;
    address[] agreeMembers;
    address[] disagreeMembers;
    bool exectuable;
    uint amount;
    Dtoken token;
}

modifier membership (MasterDAO masterDAO, address _staker){
    require(masterDAO.addressExist(_staker) == true);
    _;
}

modifier lenderLimit {
    require(msg.sender == lender);
    _;
}

modifier balanceLimit(uint amount) {
    require(amount <= poolGap - currentStake);
    _;
}

constructor (uint _poolGap, uint _DAOID, address _lender, uint _rate, MasterDAO caller, Dtoken _token) {
    currentStake = 0;
    poolGap = _poolGap;
    DAOID = _DAOID;
    lender = _lender;
    master = caller;
    rate = _rate;
    token = _token;
    token.transferFrom(address(this), address(this), 10);
}
}