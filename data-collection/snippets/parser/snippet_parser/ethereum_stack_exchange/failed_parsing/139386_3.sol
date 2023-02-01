function removePledge(uint256 _pledgeIndex, ) external {
    
    Startup storage startup = 

    uint256 length = startup.pledges.length;
    require(_pledgeIndex < length, "Index over length");

    
    Pledge memory lastPledge = startup.pledges[length-1];
    startup.pledges[_pledgeIndex] = lastPledge;
    startup.pledges.pop();
}
