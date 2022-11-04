contract A {
    uint256 public counter = 1;

    event DelegateCallFailed();

    function foo() public {
        counter += 1000;
        
        revert();
    }

    function bar() public {
        
        counter += 1;
        uint256 b = counter;
        
        (bool res,) = address(this).delegatecall(abi.encodeWithSignature("foo()"));
        if (!res) {
            
            require(b == counter, "Counter shouldn't change");
            emit DelegateCallFailed();
        }
    }
}
