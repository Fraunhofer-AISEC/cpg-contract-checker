function allElections() public view returns(electionInfo []memory) {

    uint currentIndex = 0;

    electionInfo[] memory allCreatedElections = new electionInfo[] (electionCount);

    for(uint i = 0; i < electionCount; i++){
            uint currentElectionId = i + 1;
            
            electionInfo storage currentElection = electionIdToDetails[currentElectionId];
            
            allCreatedElections[currentIndex] = currentElection;
            
            currentIndex += 1;
    }
    return allCreatedElections;
}
