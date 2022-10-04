contract A {

    uint8 stateVariable = 0;

    
    function constantVerifier(uint8 param) constant {
        
        require(param <= 5);
        
        A(this).changeState();
    }

    
    function changeState() {
        
        require(msg.sender == address(this));
        
        stateVariable++;
    }
}
