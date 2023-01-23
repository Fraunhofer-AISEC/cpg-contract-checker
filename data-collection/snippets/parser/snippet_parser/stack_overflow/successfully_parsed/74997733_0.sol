function finalizeRequest(uint index) public restricted {
    Request storage request = requests[index];
    
    require(request.approvalCount > (approversCount / 2));
    require(!request.complete);
    
    request.recipient.transfer(request.value);
    request.complete = true;
}
