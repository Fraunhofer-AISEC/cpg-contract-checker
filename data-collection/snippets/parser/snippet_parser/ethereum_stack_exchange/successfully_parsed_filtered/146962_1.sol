function doSomething() {
    uint amount = msg.value.sub(someAmount);
    _refundAddress.call{value: amount}(""); 
    
}
