function getActiveDepositIndexes() public view returns (uint256[] memory) {
    User storage user = users[msg.sender];
    Deposit[] storage deposits = user.deposits;
    uint[] memory indices = new uint[](deposits.length);
    for(uint i = 0; i < deposits.length; i++) {
        if(deposits[i].active && !deposits[i].closed){
            indices[i] = i;
        }
    }
    return indices;
 }
