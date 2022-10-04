pragma solidity ^0.4.17;

contract Lottery {
address public manager;
struct Player {
    address recipient;
    uint value;
}
Player[] public players;

mapping(uint => address[]) recipientValue;
mapping(uint => uint) recipientValueCount;

function Lottery() public {
    manager = msg.sender;
}

function enter() public payable {
    Player memory newPlayer = Player({
        recipient: msg.sender,
        value: msg.value
    });

    players.push(newPlayer);

    recipientValue[msg.value].push(msg.sender);
    recipientValueCount[msg.value]++;
}


function pickWinner(uint index) public restricted {
    address[] storage winners = recipientValue[index];
    uint prize = this.balance / recipientValueCount[index];

    for(uint i=0; i< winners.length; i++){
        winners[i].transfer(prize);
    }

    players = new Player[](0);

} 

function totalBalance() public view returns (uint) {
    return this.balance;
}


modifier restricted() {
    require(msg.sender == manager);
    _;
}
}