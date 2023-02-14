pragma solidity ^0.4.18;

contract Lottery
{

    mapping (address=> uint256) public winnings;
    address[] public tickets;

    string public name = "Lottery";
    string public symbol = "LOT";
    uint256 public maxTickets=100;
    uint256 public remainingTickets=0;
    uint public ticketCount=0;
    uint256 public randomNum =0;
    address public latestWinner;

    function Lottery(string tokenName, string tokenSymbol, uint256 maximumTickets)
    {
        name=tokenName;
        symbol=tokenSymbol;
        maxTickets=maximumTickets;
        remainingTickets=maxTickets;
    }

    function Buy() public payable
    {
        require(msg.value == 1000000000000000000);
        uint256 val= msg.value/1000000000000000000;
        require((remainingTickets - val) <= remainingTickets);
        remainingTickets-=val; 
        tickets.push(msg.sender);
        ticketCount++;
    }

    function ChooseWinner() public
    {
        require(ticketCount>0);
        randomNum=uint(block.blockhash(block.number-1))%ticketCount;
        latestWinner=tickets[randomNum];
        winnings[latestWinner]=ticketCount;
        ticketCount=0;
        remainingTickets=maxTickets;
        delete tickets;
    }
    function WithDraw() public 
    {
        require(winnings[msg.sender]>0);
        uint256 amountToWithdraw = winnings[msg.sender];
        winnings[msg.sender]=0;

        

        amountToWithdraw*=1000000000000000000;

        

        msg.sender.Transfer(amountToWithdraw);

    }

}
