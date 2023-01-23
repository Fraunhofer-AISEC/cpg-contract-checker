
pragma solidity ^0.8.0;
    
contract MyContract {
    
    
    struct Player {
        string name;
        uint goals;
    }
    
    
    Player[] players;
    
    function addPlayer(string calldata _name, uint _goals) external {
    
       Player memory player = Player(_name,_goals); 
    
       players.push(player); 
    
    }
    
}
