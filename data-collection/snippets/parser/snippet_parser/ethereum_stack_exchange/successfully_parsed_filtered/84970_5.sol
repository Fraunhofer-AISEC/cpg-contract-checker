 function getAgentDetails() public view isOwner returns(address,uint,uint,uint){
    return (agentAddress,agentID,agentCreationDate,agentAvailableEnergyToSell);
    
}
