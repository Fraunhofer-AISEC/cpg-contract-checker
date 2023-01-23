function approveRequest(uint index) public{
    Request storage request = requests[index];
    
    require( approvers[msg.sender]);
    require(!requests[index].approvals[msg.sender]);

    requests[index].approvals[msg.sender]=true;
    requests[index].approvalCount++;
}