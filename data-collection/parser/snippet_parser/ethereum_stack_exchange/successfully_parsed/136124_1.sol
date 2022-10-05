function getJobResult(bytes32 requestId) public view returns (bytes memory) {
    if (jobResults[requestId].status == Status.Success) {
        return getChainlinkResponse(requestId);
    } else {
        revert StatusError("Job not completed");
    }
}
