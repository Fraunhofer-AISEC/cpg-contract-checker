function updateRequest(uint256 requestIndex, Requests memory bar) external 
{
    Rqst[msg.sender][requestIndex].status = bar.status;
    Rqst[msg.sender][requestIndex].amount = bar.amount;
    Rqst[msg.sender][requestIndex].description = bar.description;
}
