pragma solidity ^0.8.0;

contract Agent {
  struct Agent {
    uint idAgent;
    address direction;
    uint[] preferences;
}
Agent[] agents;

uint256 public numAgents;
mapping(address=>bool) _isRegistered;




function regAgent(uint[] memory _preferences) public{
    require(!_isRegistered[msg.sender],"sender is already registered");
    Agent memory newAgent = Agent(numAgents, msg.sender, _preferences);
    agents.push(newAgent);
    _isRegistered[msg.sender]=true;
    numAgents++;
}

}
