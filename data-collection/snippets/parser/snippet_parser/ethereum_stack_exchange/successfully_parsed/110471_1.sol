    function approveTransferRequest() public payable {
    approvalCount += 1;
    
    if(approvalCount >= approvalMinimum){

        (bool success,  ) = originalReceiver.call{value: originalAmount}("");
        require(success, "Failed to transfer the funds, aborting.");
    }
}
