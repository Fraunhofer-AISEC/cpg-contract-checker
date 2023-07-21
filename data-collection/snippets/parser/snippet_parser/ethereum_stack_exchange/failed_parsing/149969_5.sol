XToken Token;

bool public is_preselling;
address payable owner;
address payable tokenSource; 
address payable fundreceiver;
uint256 soldTokens;
uint256 receivedFunds;


struct tokenVesting{
    uint256 amount;        
    uint256 date_added;     
    uint256 redeem_date;    
    uint256 redeem_count;
}

uint256 redemptionCount = 1; 
uint256 lockDays = 30; 
uint256 rewardRate = 5; 

uint256 public RecordId;
mapping(uint256 => tokenVesting) idVesting; 
mapping(uint256 => address) recordIdOwner;   

constructor(XToken _tokenAddress) {
    Token = _tokenAddress;
    owner = payable(_tokenAddress);
    tokenSource = payable(0xF40.............788);
    fundreceiver = payable(0xAd9.......14D5);

    is_preselling = true;
}

modifier onlyOwner() {
    require(msg.sender == owner, "invalid owner");
    _;
}


function tokensale(uint256 _amount ) public payable returns(bool)  {
    require(is_preselling, "pre selling is over.");

    uint256 _rewardAmount = (_amount * rewardRate) / 100; 
    uint256 _totalTokens = _amount + _rewardAmount; 

    RecordId += 1; 

    
    tokenVesting storage _vesting = idVesting[RecordId];
    _vesting.amount = _totalTokens;
    _vesting.date_added = block.timestamp;
    _vesting.redeem_date = block.timestamp + (lockDays * 1 days); 

    
    recordIdOwner[RecordId] = msg.sender;

    
    Token.transferFrom(tokenSource, address(this), _totalTokens);

    
    fundreceiver.transfer(msg.value);
    
    soldTokens += _amount;
    receivedFunds += msg.value;

    emit TokenPurchased(msg.sender, _amount, msg.value);
    return true;
}

function Redeem(uint256 _id) public returns(bool)  {
    
    
    address _recordOwner = recordIdOwner[_id];
    require(_recordOwner == msg.sender, "invalid owner");

    tokenVesting storage _vesting = idVesting[_id];

    
    require(_vesting.redeem_count < redemptionCount, "already redeemed");
    
    
    uint256 _redeemDate = _vesting.redeem_date;  
    require(block.timestamp >= _redeemDate, "not yet ready to redeem");

    uint256 _redeemAmount = _vesting.amount / redemptionCount; 

    _vesting.redeem_count += 1; 
    _vesting.redeem_date = block.timestamp + (lockDays * 1 days); 

    
    Token.transfer(msg.sender, _redeemAmount);

    emit ClaimedToken(msg.sender, _id, block.timestamp);
    return true;
}

function getTokenSupply() public view returns(uint256){
    return Token.totalSupply();
}

function getTokenbalance(address _address) public view returns(uint256){
    return Token.balanceOf(_address);
}

function totalSoldTokens() public view returns(uint256){
    return soldTokens;
}
function totalReceivedFunds() public view returns(uint256){
    return receivedFunds;
}

function getbalance()  public onlyOwner {
    owner.transfer(address(this).balance);
}


function SetReceiver(address payable _fund) public onlyOwner {
    fundreceiver = _fund;
}


function SetPreSellingStatus() public onlyOwner {
    if (is_preselling) {
        is_preselling = false;
    } else {
        is_preselling = true;
    }
}
