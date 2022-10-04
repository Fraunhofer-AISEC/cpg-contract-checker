pragma solidity >=0.4.25 <0.6.0;

contract Monopoly {

string public player1;
uint32 public player2;
uint32 public player3;

    constructor(string memory _player1, uint32 _player2, uint32 _player3) public {
    player1 = _player1;
    player2 = _player2;
    player3 = _player3;
    }
}
