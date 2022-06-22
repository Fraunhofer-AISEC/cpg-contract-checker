contract ERC223Receiver {
    function tokenReceiveLogic1() internal {
        
        
    }

    function tokenReceiveLogic2() internal {
        
        
    }


    function tokenFallback(
        address _sender,
        uint256 _value,
        bytes _extraData) returns (bool) {

        require(_value > 10);
        return true;
        
        
        
        
        
    }
}

contract Token {
    function transfer(address to, uint value) public {
        bytes memory empty;
        bool shouldFail = ERC223Receiver(to).tokenFallback(msg.sender,value,empty);
        

    }
}
