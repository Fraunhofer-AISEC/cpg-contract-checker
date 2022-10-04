pragma solidity ^0.4.19;

contract Lottery {

    address[] tickets;
    address owner;
    uint ticketCount = 0;
    uint maxTickets = 100;


    function buy() public payable {
        require(msg.value == .001 ether);

        tickets.push(msg.sender);
        ticketCount++;
    }

    function currentTickets() public constant returns(uint currentNumber){
        return ticketCount;
    }
}
