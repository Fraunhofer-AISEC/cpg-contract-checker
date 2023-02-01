    

    fallback() external {
        _fallback();
    }

    receive() external payable {
        _fallback();
    }

    function _fallback() private {

        bytes4 sel = msg.sig;

        
        require(exists(sel));

        
        require(hasRole(getRole(sel), msg.sender)); <== unless this is a view/pure, but how to know?

        

