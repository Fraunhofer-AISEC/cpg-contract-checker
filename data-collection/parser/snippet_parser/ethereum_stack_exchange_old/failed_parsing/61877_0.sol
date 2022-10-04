contract ERC223Receiver {
    function tokenReceiveLogic1() internal {
        require(tokenReceiveAmount > 3);
        
    }

    function tokenReceiveLogic2() internal {
        require(tokenReceiveAmount > 1);
        
    }


    function tokenFallback(
        address _sender,
        uint256 _value,
        bytes _extraData) returns (bool) {
        if (condition 1) {
            
            
        } else if (condition 2) {
            
            
        }
    }
}
