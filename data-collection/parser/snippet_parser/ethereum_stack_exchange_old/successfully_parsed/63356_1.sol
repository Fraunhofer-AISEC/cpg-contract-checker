contract One {
    function callme() external {
        
    }
}

contract Two {
    
    
    function callOne(One one) external {
        
        one.callme();
    }
}
