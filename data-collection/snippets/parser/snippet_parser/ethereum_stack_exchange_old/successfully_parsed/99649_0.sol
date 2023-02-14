pragma solidity ^0.6.7;

contract Betting {

enum State { Created, Locked, Released }

struct Bet {

string pair;

uint price;

uint date;
}

event BetMade(address bettor, uint amount);

function bet() public payable {

    emit BetMade(msg.sender, msg.value);

}



} 
