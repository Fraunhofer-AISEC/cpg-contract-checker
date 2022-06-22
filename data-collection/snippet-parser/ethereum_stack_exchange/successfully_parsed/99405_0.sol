contract Parent {
    
    address reciever;
    MyERC20 token;
    
    constructor(address _token) public {
        reciever = msg.sender;
        token = MyERC20(_token);
    }
    
    function payReciever(uint256 amount) public {
        
        token.transfer(reciever, amount);
        
    }
    
}

contract Child {
    
    address child;
    
    constructor(address _child) public {
        child = _child;
    }
    
    function transfer(uint amount) public returns (bool) {
        
        (bool success, bytes memory data) = child.delegatecall(
            abi.encodeWithSignature("payReciever(uint256)", amount)
        );
        return success;
        
    }
    
}
