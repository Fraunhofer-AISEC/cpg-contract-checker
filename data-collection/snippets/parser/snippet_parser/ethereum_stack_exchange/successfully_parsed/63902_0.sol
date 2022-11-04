    contract Test {
    uint public y;
    uint256 public bal;
    address payable public me;
    
    
    
    
    fallback() external payable { 
        y = msg.value; 
        bal = address(this).balance;
    }

    
    
    receive() external payable { 
        y = msg.value; 
        bal = address(this).balance;
    }

    
    
    
    
    
    
    function close() public {
     me = payable(msg.sender);
    selfdestruct(me);
    } 
}
