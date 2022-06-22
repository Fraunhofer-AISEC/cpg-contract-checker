
contract Example {
    bool locked;
    
    function doSomething() public {
        require(locked != true);
        locked = true
        
        locked = false
    }
}
