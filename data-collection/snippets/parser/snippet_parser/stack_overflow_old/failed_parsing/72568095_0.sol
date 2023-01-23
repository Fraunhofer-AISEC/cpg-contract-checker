function foo(
    address[] var1, 
    address[] var2, 
    uint[] var3, 
    uint[] var4,
) {
    externalContract.functionThatCallsBack(var1)
}

function callback(bytes calldata var5){
    bar(var2, var3, var4)
}

function bar() {
    
}
