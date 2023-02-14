function appendResultsToCalldata(ProposalCore storage proposal) internal virtual returns (bytes[] memory) {
    bytes[] memory combinedData = new bytes[](proposal.calldatas.length);
    for (uint i = 0; i < proposal.calldatas.length; i++) {
        
        bytes memory votesData = abi.encode(proposal.votes[i]);
        uint totalLength = proposal.calldatas[i].length + votesData.length + proposal.voteChoices[i].data.length;
        
        bytes memory data = new bytes(totalLength);

        
        uint offset = 0;
        
        for (uint j = 0; j < proposal.calldatas[i].length; j++) {
            data[offset++] = proposal.calldatas[i][j];
        }
        
        for (uint j = 0; j < votesData.length; j++) {
            data[offset++] = votesData[j];
        }
        
        for (uint j = 0; j < proposal.voteChoices[i].data.length; j++) {
            data[offset++] = proposal.voteChoices[i].data[j];
        }
        
        combinedData[i] = data;
    }

    return combinedData;
}
