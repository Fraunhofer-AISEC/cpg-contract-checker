function listMyPromises() public returns(uint256[] memory ){ 
    uint256 count = getCount();
    uint256[] memory List = new uint256[](count);
    
    uint256 j;
    for (uint i = 0; i < table.length; i++) {
        if(table[i].userAddress==msg.sender){
            List[j] = uint256(table[i].friendAddress);
            j++;
        }
    }

    return List;
}

function getCount() internal view returns (uint) {
    uint count;

    for (uint i = 0; i < table.length; i++) {
        if (table[i].userAddress == msg.sender) {
            count++;
        }
    }
    
    return count;
}
