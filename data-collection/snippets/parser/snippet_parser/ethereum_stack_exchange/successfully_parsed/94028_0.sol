address payable player;

address payable casino;
uint256 public casinoDeposit;
uint256 betAmount;
uint256 maxBet = .001 ether;
bytes32 commitHash;
uint gameTimeOut;
uint256  matchBetTimeOut;
uint256 revealTimeOut;
uint256 result;
bool win;
address payable contractAddress = address(this);

constructor () public payable{
    require(msg.value == 1 ether);
    casinoDeposit = msg.value;
}
