function callX(address x) {
    
    (bool success, bytes memory data) = x.call("");
    if(success) {
        doSomething();
    }
    else {
        doSomethingElse();
    }

}
