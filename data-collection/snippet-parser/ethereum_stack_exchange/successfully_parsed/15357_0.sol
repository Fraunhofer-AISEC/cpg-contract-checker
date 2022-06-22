function f(uint blockNumber, bool finalBlock) returns (bool) {
    if (msg.sender != protocolParameters.A)
        return false; 

    if (blockNumber > protocolValues.blockNumber && blockNumber <= protocolParameters.numberOfBlocks*2) {
        protocolValues.stageNumber = blockNumber*2;

    } else {
        throw; 
    }
    
    if (finalBlock) {
        protocolValues.phaseNumber = 2; 
        setPayoffs(protocolParameters.DA, protocolParameters.DB + protocolParameters.FV);
    }

    return true;
}
