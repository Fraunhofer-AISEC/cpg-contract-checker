contract sendEther{
    
    
    
    
    

    

    receive() external payable {}

    function sendviaTransfer(address payable _to) external payable{
        _to.transfer(123); 
        
    }

    function sendviaSend(address payable _to) external payable{
        bool sent = _to.send(123);

        require(sent, "failed");
    }

    function sendviaCall(address payable _to) external payable{
        (bool sent, ) = _to.call{value : 123}(""); 
        require(sent, "failed");

    }
}
