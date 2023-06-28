function sendEther() public payable {
        require(msg.value == etherAmount, "Incorrect Ether amount sent");
        payable(target).transfer(msg.value);      
       
        
    }

