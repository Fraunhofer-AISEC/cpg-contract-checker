
pragma solidity ^0.8.5;

contract TicTacToe
{
    
    modifier has_value {
      if(msg.value > 0)
        _;
    }

    
    struct Game
    {
        uint balance;
        uint turn;
        address opposition;
        uint time_limit;
        mapping(uint => mapping(uint => uint)) board;
        bool isSet;
    }

    
    mapping (address => Game) games;

    
    function start() public has_value payable
    {
        
        Game storage g = games[msg.sender];
        
        if(g.balance == 0)
        {
            g.isSet = true;
            restart(msg.sender);
            g.balance += msg.value;
        }
    }
}