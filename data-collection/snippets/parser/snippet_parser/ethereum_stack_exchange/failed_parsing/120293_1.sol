function loopAndClear(uint256 street) public {
uint[] storage array = streetMap[street];
for (uint i=array.length; i > 0; i--) {
    uint itemID = array[i-1];
    execute(itemID); 
    if (accounts[itemID].balance == 0) {
        delete streetMap[i-1]; 
    }            
}
