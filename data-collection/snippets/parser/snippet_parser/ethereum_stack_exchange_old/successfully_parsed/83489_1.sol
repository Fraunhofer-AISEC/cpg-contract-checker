function withdraw(uint256 amount) external {

    
    uint256 amount;

    
    for (uint16 i = 0; i < timestamps[msg.sender].length; i++) {

        
        uint256 memory timestamp = timestamps[msg.sender][i];

        
        if (timestamp <= block.timestamp) {

            
            amount += requests[msg.sender][timestamp];

        } else {

            

        }
    }

    
    require(myToken(msg.sender, amount));
}
