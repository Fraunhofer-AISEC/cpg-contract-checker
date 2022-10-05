
    
    function withdraw() public onlyOwner{
        msg.sender.transfer(address(this).balance);
    }
    
    receive() external payable {msg.value}
     
    fallback() external payable {msg.value}
    
        
    

