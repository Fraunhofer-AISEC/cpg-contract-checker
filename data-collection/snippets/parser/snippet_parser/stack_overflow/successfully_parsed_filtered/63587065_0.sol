pragma solidity ^0.4.17;

function pickWinner() public restricted {
    uint index = random() % players.length;
    players[index].transfer(this.balance);
    players = new address[](0);
}
