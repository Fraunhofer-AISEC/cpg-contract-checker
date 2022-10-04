pragma solidity ^0.4.24;
contract LeagueWinners{
    address public manager;
    address[] public players;
    uint256 MINIMUM = 1000000000000000;
    constructor() public{
        manager = msg.sender;
    }
    function enter() public payable{
        assert(msg.value > MINIMUM);
        players.push(msg.sender);
    }
    function getWinner() public{
        assert(msg.sender == manager);
        
        
        result = 0; 
        players[result].transfer(address(this).balance);
        
        
        players = new address[](0);
        
    }
}
