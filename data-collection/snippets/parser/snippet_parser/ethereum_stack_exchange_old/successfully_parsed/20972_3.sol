contract target {
    event something();
    function doSomething() {
        something();
    }
}

contract relay {
    target myTarget;

    function relay() {
        
        myTarget = new target();
    }

    function relayCall() {
        myTarget.doSomething();
    }
}
