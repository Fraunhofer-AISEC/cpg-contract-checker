pragma solidity ^0.8.0;
    
contract MyContract {
    
    
    struct Player {
        string name;
        uint goals;
    }
    
    
    Player[] player;
    
    function addPlayer(string calldata _name, uint _goals) external pure{
    
       Player memory player = Player({name:_name, goals:_goals}); 
    
       players.push(player); 
    
    }
    
}
