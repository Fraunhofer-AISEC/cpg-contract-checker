contract CalledContract {
    function doSomething() public {
    }
}

contract CallerContract {
    function callAnotherContract(address addr) external {
        CalledContract called = CalledContract(addr);
        called.doSomething();
    }
}
