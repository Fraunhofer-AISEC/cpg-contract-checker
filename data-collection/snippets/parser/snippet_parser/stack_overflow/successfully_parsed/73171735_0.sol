contract Bets is IWeb3BetsBetsV1 {
address public better;

address public eventAddress;

address public marketAddress;

address public poolAddress;

uint256 public stake;

modifier onlyEventOwner {
    IWeb3BetsEventV1 betEvent = IWeb3BetsEventV1(eventAddress);
    require(tx.origin == betEvent.getEventOwner(), "Only bet owners can apply this function");
    
    _;
}

modifier onlyBetter {
    require(tx.origin == better, "Only event better can call this function");
    _;
}

constructor(
    address _eventAddress,
    address _marketAddress,
    address _poolAddress,
    uint256 _stake,
    address _better
) {
    eventAddress = _eventAddress;
    marketAddress = _marketAddress;
    stake = _stake;
    better = _better;
    poolAddress = _poolAddress;
}

function getBetStake() override external view returns (uint256) {
    return stake;
}

function getBetter() override external view returns (address) {
    return better;
}

function getBetPoolAddress() override external view returns (address) {
    return poolAddress;
}

function getBetMarketAddress() override external view returns (address) {
    return marketAddress;
}

function getBetEventAddress() override external view returns (address) {
    return eventAddress;
}


function withdraw() override external payable onlyBetter {
    require(address(this).balance > 0, "This bet has no funds");

    IWeb3BetsEventV1 eventV1 = IWeb3BetsEventV1(eventAddress);
    uint status = eventV1.getEventStatus();

    
    if (status== 0 && status ==1){
        revert("An event must be cancelled or ended to withdraw funds and earnings");

    }

    IWeb3BetsMarketV1 marketV1 = IWeb3BetsMarketV1(marketAddress);
    bool isWinningPool = marketV1.isWinningPool(poolAddress);
    if (!isWinningPool){
        revert("You lost this bet");
    }
    
    payable(msg.sender).transfer(address(this).balance);
}

fallback() payable external {}

receive() payable external {}
}