contract B is A {
    uint state;
    
    constructor() A() public { state = 0; }
    function performOperation() internal { state = state + 1; }
}
