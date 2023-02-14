function receiveApproval(address from, uint256 tokens, address token, bytes data) public {
    TheTokenContract instanceContract = TheTokenContract(token);
    instanceContract.transferFrom(from,owner,20);
    register[msg.sender] = data;      
}  
