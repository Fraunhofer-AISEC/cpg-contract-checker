browser/chainlink.sol:27:59: TypeError: Invalid type for argument in function call. Invalid implicit conversion from literal_string "fulfillEthereumPrice(bytes32,uint256)" to bytes4 requested.
    ChainlinkLib.Run memory run = newRun(jobId, this, "fulfillEthereumPrice(bytes32,uint256)");
                                                      ^-------------------------------------^

browser/chainlink.sol:31:43: TypeError: Type is not callable
    requestId = chainlinkRequest(run, LINK(0));
                                      ^-----^

browser/chainlink.sol:31:43: TypeError: Invalid type for argument in function call. Invalid implicit conversion from tuple() to uint256 requested.
    requestId = chainlinkRequest(run, LINK(0));
                                      ^-----^
