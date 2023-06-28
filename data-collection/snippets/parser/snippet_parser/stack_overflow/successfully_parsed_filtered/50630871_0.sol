pragma solidity ^0.4.23;

contract Swindle {
    string  public eventName;
    uint public entryFee;
    string[] public players;
    string public winner;
    uint public winnings;

    function comp(string _eventName, uint _entryFee) public {
        eventName = _eventName;
        entryFee = _entryFee;
    }

    function addPlayers(string _player) public {
        players.push(_player);
    }

    function winner(string _player) public returns (string, uint) {
        winner = _player;
        winnings = (players.length * entryFee);
        return (winner, winnings);
    } 
}
