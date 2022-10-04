


function regAgent(uint[] _preferences) public{
    Agent memory newAgent = Agent(numAgents, msg.sender, _preferences);
    agents.push(newAgent);
    numAgents++;
}
