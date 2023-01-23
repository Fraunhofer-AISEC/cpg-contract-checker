contract A {

    uint8 stateVariable = 0;

    
    function constantVerifier(uint8 param) constant returns (bool){
        if (param <= 5) {
            return true;
        }
        return false;
    }

    
    function changeState() {
        
        require(msg.sender == address(this));
        
        stateVariable++;
    }

}
