contract mycontract {
    constructor() payable {}
    
    function withdraw(uint256 amount) public {  
        
        
        
        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "Transfer failed.");
    }
}
