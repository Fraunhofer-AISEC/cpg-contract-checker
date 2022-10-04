contract SampleCrowdsale is ERC20Detailed, Ownable, FinalizableCrowdsale, TokenTimelock {
    constructor () public ERC20Detailed("SampleCrowdsale", "SCRT", 15) {

    }

    mapping (address => uint256) private balances;

    uint256 public totalSupply = 1000000000000000000000000; 
    uint256 public constant TOKENS_SALE_HARD_CAP = 650000000000000000000000;
    uint256 public constant BASE_RATE = 32500000;

    uint64 private constant dateHOTSale = 1517961600;
    uint64 private constant dateSaleA = 1557991800 - 7 hours;
    uint64 private constant dateSaleB = 1557993600 - 7 hours;
    uint64 private constant dateSaleC = 1557995400 - 7 hours;
    uint64 private constant dateSaleD = 1557999000 - 7 hours;
    uint64 private constant date17May2019 = 1557999180 - 7 hours;

    uint256[4] private roundCaps = [
        100000000000000000000000, 
        250000000000000000000000,
        450000000000000000000000, 
        650000000000000000000000 
    ];
    uint8[4] private roundDiscountPercentages = [50, 25, 12, 6];

    uint64 private constant dateTeamTokensLockedTill = 1557999360 - 7 hours;

    bool public _finalized = false;

    address public timelockContractAddress;

    modifier inProgress {
        require(totalSupply < TOKENS_SALE_HARD_CAP && !_finalized && now >= dateHOTSale);
        _;
    }

    modifier beforeEnd {
        require(!_finalized);
        _;
    }

    function sampleCrowdSale() public {
        }

    modifier tradingOpen {
        require(_finalized);
        _;
    }

    function () external payable {
        purchaseTokens(msg.sender);
    }

    function purchaseTokens(address _beneficiary) public payable inProgress {
        require(msg.value >= 0.05 ether);
        uint256 tokens = computeTokenAmount(msg.value);
        require(totalSupply.add(tokens) <= TOKENS_SALE_HARD_CAP);
        doIssueTokens(_beneficiary, tokens);
        address(0).transfer(address(this).balance);
    }

    function issueTokens(address _beneficiary, uint256 _tokens) public onlyOwner beforeEnd {
        doIssueTokens(_beneficiary, _tokens);
    }

    function doIssueTokens(address _beneficiary, uint256 _tokens) internal {
        require(_beneficiary != address(0));

        totalSupply = totalSupply.add(_tokens);
        balances[_beneficiary] = balances[_beneficiary].add(_tokens);

        emit Transfer(address(0), _beneficiary, _tokens);
    }

    function price() public view returns (uint256 tokens) {
        return computeTokenAmount(1 ether);
    }

    function computeTokenAmount(uint256 ethAmount) internal view returns (uint256 tokens) {
        uint256 tokenBase = (ethAmount.mul(BASE_RATE)/10000000000000)*10000000000;
        uint8 roundNum = currentRoundIndex();
        tokens = tokenBase.mul(100)/(100 - (roundDiscountPercentages[roundNum]));
        while(tokens.add(totalSupply) > roundCaps[roundNum] && roundNum < 4){
           roundNum++;
           tokens = tokenBase.mul(100)/(100 - (roundDiscountPercentages[roundNum]));
        }
    }

    function currentRoundIndex() internal view returns (uint8 roundNum) {
        roundNum = currentRoundIndexByDate();

        while(roundNum < 4 && totalSupply > roundCaps[roundNum]) {
            roundNum++;
        }
    }

    function currentRoundIndexByDate() internal view returns (uint8 roundNum) {
        require(now <= date17May2019);
        if(now > dateSaleD) return 4;
        if(now > dateSaleC) return 3;
        if(now > dateSaleB) return 2;
        if(now > dateSaleA) return 1;
        else return 0;
    }

    function finalize() public onlyOwner beforeEnd {
        uint256 lockedTokens = 230000000000000000000000;
        uint256 partnerTokens = 260000000000000000000000;

        issueLockedTokens(lockedTokens);
        issuePartnerTokens(partnerTokens);

        totalSupply = totalSupply.add(lockedTokens+partnerTokens);

        _finalized = true;

        address(0).transfer(address(this).balance);
    }

    function issueLockedTokens(uint lockedTokens) internal {
        TokenTimelock lockedTeamTokens = new TokenTimelock(this, address(0), dateTeamTokensLockedTill);
        timelockContractAddress = address(lockedTeamTokens);
        balances[timelockContractAddress] = balances[timelockContractAddress].add(lockedTokens);
        emit Transfer(address(0), timelockContractAddress, lockedTokens);
    }

    function issuePartnerTokens(uint partnerTokens) internal{
        balances[address(0)] = partnerTokens;
        emit Transfer(address(0), address(0), partnerTokens);
    }

    function transferFrom(address _from, address _to, uint256 _value) public tradingOpen returns (bool) {
        return transferFrom(_from, _to, _value);
    }

    function transfer(address _to, uint256 _value) public tradingOpen returns (bool) {
        return transfer(_to, _value);
    }
}
