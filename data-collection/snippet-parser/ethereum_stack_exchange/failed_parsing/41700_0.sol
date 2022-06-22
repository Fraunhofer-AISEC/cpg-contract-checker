event ErrorMessage(bytes32 uid, string msg);  

function doSomething (uint value, bytes32 uid) {
    if(value > balance) {
        ErrorMessage(uid, 'SomeErrorCode');
        revert();
    }
}
