function withdraw(uint256 amount) external {

    WithdrawalRequest[] storage requests = withdrawalRequests[msg.sender];

    for (uint i=0; i < requests.length; i++) {

        
        if (bytes(requests[i]).length == 0) { continue }

        if (block.timestamp >= requests[i].withdrawableAt) {

            

            
            delete requests[i];

        }
    }

    
}
