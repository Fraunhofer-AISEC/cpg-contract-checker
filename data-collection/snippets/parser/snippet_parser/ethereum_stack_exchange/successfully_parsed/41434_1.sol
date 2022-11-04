struct AttributeStats {
    bool initialized;
    Status status;
    bytes32 validationDuration;
    bytes32 value;
}
mapping (uint256 => AttributeStats) attributeStats;

function initializeIfNeeded(uint256 id) internal {
    AttributeStats stats = attributeStats[id];

    if (!stats.initialized) {
        stats.initialized = true;
        stats.validationDate = now;
        stats.status = 1;
        stats.validationDuration = 356;
    }        
}

function doSomething(uint256 id) public {
    initializeIfNeeded(id);

    AttributeStats storage stats = attributeStats[id];

    
}
