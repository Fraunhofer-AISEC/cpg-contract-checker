    address payable owner  =  msg.sender;   

    modifier onlyOwner(){
        require(msg.sender == owner);
        _;
    }
    function close() public onlyOwner { 
    selfdestruct(owner);  
}
    
