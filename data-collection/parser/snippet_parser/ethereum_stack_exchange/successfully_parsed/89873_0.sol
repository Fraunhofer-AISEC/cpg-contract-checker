    uint nonce;
    struct Agent {
        uint idAgent;
        uint[] O_preferences;
    }
    mapping(address => Agent) public agents;
    address[] public agentsInfo;
    
    
    
    
    
    function setAgent(address _address, uint _idAgent, uint[] _O_Preferences) public {
        var agent = agents[_address];
        agent.idAgent = _idAgent;
        agent.O_preferences = _O_Preferences;
        agentsInfo.push(_address) -1;
    }
