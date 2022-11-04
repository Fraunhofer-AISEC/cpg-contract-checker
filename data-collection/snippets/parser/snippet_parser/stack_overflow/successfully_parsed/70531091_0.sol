pragma solidity >0.8.0;

contract Receiver {
    string greeting = "Hello";
    address private immutable original;
    event Greeting(string greeting, address original, address addressThis);

    constructor() {
        original = address(this);
    }

    function checkNotDelegateCall() private view {
        require(address(this) == original);
    }

    modifier noDelegateCall() {
        checkNotDelegateCall();
        _;
    }
    
    function greet() external noDelegateCall {
        emit Greeting(greeting, original, address(this));
    }
}

contract Sender {
    string greeting = "Hi";
    
    function delegatedGreeting(address _contract) external {
        (bool success,) = _contract.delegatecall(
            abi.encodeWithSignature("greet()")
        );
    }
}
