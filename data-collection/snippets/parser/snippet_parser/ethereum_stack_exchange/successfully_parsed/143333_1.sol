

import '@openzeppelin/contracts/utils/Strings.sol';
import '@openzeppelin/contracts/token/ERC20/IERC20.sol';
import '@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol';

pragma solidity >=0.7.0 <0.9.0;

contract Lottery {


uint256 public constant ticketPrice = 0.001 ether; 
uint256 public constant maxTickets = 1000; 
uint256 private ticketProject = 15; 
uint256 public constant duration = 1440 minutes; 
address private project_tax = 0x123; 
uint256 public expiration; 
address public lotteryOperator; 
uint256 public operatorTotalProject = 0; 
address public lastWinner; 
uint256 public lastWinnerAmount; 
uint256 public lotteryId; 

mapping(address => uint256) public winnings; 
address[] public tickets; 

using SafeERC20 for IERC20;


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

constructor() {
    IERC20 token = IERC20(address(0x31Cc043954bcaAaC2af1A3E6eC3caF4d45215cFA));
    lotteryOperator = msg.sender;
    expiration = block.timestamp + duration;
    lotteryId = 1;
}


function getTickets() public view returns (address[] memory) {
    return tickets;
}

function getBalance() public view returns (uint) {
    return address(this).balance;
}
function getWinningsForAddress(address addr) public view returns (uint256) {
    return winnings[addr];
}
function getLotteryId() public view returns(uint256) {
    return lotteryId;
}
function BuyTickets() public payable {
    require(
        msg.value % ticketPrice == 0,
        string.concat(
            "the value must be multiple of ",
            Strings.toString(ticketPrice),
            " Ether"
        )
    );
    uint256 numOfTicketsToBuy = msg.value / ticketPrice;

    require(
        numOfTicketsToBuy <= RemainingTickets(),
        "Not enough tickets available."
    );

    for (uint256 i = 0; i < numOfTicketsToBuy; i++) {
        tickets.push(msg.sender);
    }
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
    operatorTotalProject += (tickets.length * ticketPrice) * ticketProject / 100;
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
    address payable winner = payable(msg.sender);
    uint256 reward2Transfer = winnings[winner];
    return reward2Transfer;
}
function WithdrawWinnings() public isWinner {        
    address payable winner = payable(msg.sender);
    uint256 reward2Transfer = winnings[winner];
    winnings[winner] = 0;
    winner.transfer(reward2Transfer);  
}
function WithdrawProject() public isOperator {
    address payable operator = payable(project_tax);
    uint256 project2Transfer = operatorTotalProject;
    operatorTotalProject = 0;
    operator.transfer(project2Transfer);
}
function RefundAll() public {
    require(block.timestamp >= expiration, "The lottery has not expired yet");
    for (uint256 i = 0; i < tickets.length; i++) {
        address payable to = payable(tickets[i]);
        tickets[i] = address(0);
        to.transfer(ticketPrice);
    }
    delete tickets;
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
}
