    uint last =      

    uint frequency = 

    uint inflation = 

    uint multiple =  

    uint current = block.timestamp;

    uint intervals = (current - last) /  frequency; 
    
    uint newInflation = totalSupply;

    for (uint i; i < intervals; ++i) {
        newInflation += newInflation * inflation / multiple;
    }

    newInflation -= totalSupply;
