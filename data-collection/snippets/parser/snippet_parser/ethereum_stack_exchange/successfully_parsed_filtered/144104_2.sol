

pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Address.sol";


error DEX__TokenTransferFailed(address tokenAddress);

contract Lottery {

using SafeERC20 for IERC20;
using Address for address;

uint256 public constant ticketPrice = 100000000000000; 
uint256 public undoDecimal = 10;
uint256 public constant maxTickets = 100; 
uint256 public constant maxTicketsAllow = 5; 
uint256 public constant comProject = 15; 
uint256 public constant duration = 1440 minutes; 
address public project_wallet = 0x123;
uint256 public expiration; 
address public lotteryOperator; 
uint256 public operatorTotalProject = 0; 
address public lastWinner; 
uint256 public lastWinnerAmount; 
uint256 public lotteryId; 

mapping(address => uint256) public winnings; 
address[] public tickets; 

event Received(address, uint256);

receive() external payable {
    emit Received(msg.sender, msg.value);
}


modifier isOperator() {
    require(
        (msg.sender == lotteryOperator),
        "Caller is not the lottery operator"
    );
    _;
}

modifier isWinner() {
    require(IsWinner(), "Caller is not a winner");
    _;
}

modifier isOwnable() {
    require(
        (msg.sender == lotteryOperator),
        "Only owner can change ownership"
    );
    _;
}
constructor() {
    lotteryOperator = msg.sender;
    expiration = block.timestamp + duration;
    lotteryId = 1;
}

function transferOwnership(address _newOwner) public {
    require(msg.sender == lotteryOperator);
    lotteryOperator = _newOwner;  
}

function getTickets() public view returns (address[] memory) {
    return tickets;
}

function getBalance(address _tokenAddress) public view returns (uint256) {
    IERC20 _token = IERC20(_tokenAddress);
    return _token.balanceOf(msg.sender);
}

function getWinningsForAddress(address addr) public view returns (uint256) {
    return winnings[addr];
}

function getLotteryId() public view returns(uint256) {
    return lotteryId;
}

function BuyTickets(
    address _tokenAddress,
    uint256 _numOfTicketsToBuy
) public {
    require(
        _numOfTicketsToBuy <= RemainingTickets(),
        "Not enough tickets available."
    );
    IERC20 _token = IERC20(_tokenAddress);
    uint256 _tokenDecimal = IERC20Metadata(_tokenAddress).decimals();
    uint256 _totalCost = _numOfTicketsToBuy * (ticketPrice * (10 ** (_tokenDecimal - undoDecimal)));
    require(getBalance(_tokenAddress) >= _totalCost, "Not enough balance");

    for (uint256 i = 0; i < _numOfTicketsToBuy; i++) {
        tickets.push(msg.sender);
    }
    if (!_token.transferFrom(msg.sender, lotteryOperator, _totalCost))
        revert DEX__TokenTransferFailed(address(_token));
}

function DrawWinnerTicket() public isOperator {
    require(tickets.length > 0, "No tickets were purchased");

    bytes32 blockHash = blockhash(block.number - tickets.length);
    uint256 randomNumber = uint256(
        keccak256(abi.encodePacked(block.timestamp, blockHash))
    );
    uint256 winningTicket = randomNumber % tickets.length;
    address winner = tickets[winningTicket];
    lastWinner = winner;
    winnings[winner] += (tickets.length * ticketPrice) / 2;
    lastWinnerAmount = winnings[winner];
    operatorTotalProject += (tickets.length * ticketPrice) * comProject / 100;
    delete tickets;
    expiration = block.timestamp + duration;
    lotteryId++;
}

function restartDraw() public isOperator {
    require(tickets.length == 0, "Cannot Restart Draw as Draw is in play");
    delete tickets;
    expiration = block.timestamp + duration;
}

function checkWinningsAmount() public view returns (uint256) {
    address winner = msg.sender;
    uint256 reward2Transfer = winnings[winner];
    return reward2Transfer;
}


function WithdrawWinnings(
    address _tokenAddress,
    address _lastWinner
) public isWinner {
    IERC20 _token = IERC20(_tokenAddress);
    address _winner = _lastWinner;
    uint256 reward2Transfer = lastWinnerAmount;
    lastWinnerAmount = 0;
    _token.transferFrom(lotteryOperator, _winner, reward2Transfer);
}

function WithdrawProject(
    address _tokenAddress,
    address _project_wallet
) public isOperator {
    IERC20 _token = IERC20(_tokenAddress);
    address _project = _project_wallet;
    uint256 project2Transfer = operatorTotalProject;
    operatorTotalProject = 0;
    _token.transferFrom(lotteryOperator, _project, project2Transfer);
}

function IsWinner() public view returns (bool) {
    return winnings[msg.sender] > 0;
}

function CurrentWinningReward() public view returns (uint256) {
    return tickets.length * ticketPrice;
}

function RemainingTickets() public view returns (uint256) {
    return maxTickets - tickets.length;
}

function setExpireTime(uint256 _time) public isOperator {
    expiration = _time;
}
}