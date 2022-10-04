
uint timeOfStake = block.timestamp;
uint timeToDistribute = timeOfStake + 30 days;


function distribute() public{
    require(block.timestamp >= timeToDistribute);
    distribute();
}

function distribute(){
    
    
}
