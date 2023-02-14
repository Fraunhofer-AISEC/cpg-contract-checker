contract Set {
    bool public ret;
    address public tokenAddr;
    address public userAddr;
    function Set(address tokenAddr_,address userAddr_){
        tokenAddr=tokenAddr_;
        userAddr=userAddr_;
    } 
    function call1(byte bb){
        ret=tokenAddr.call("notify",bb,userAddr);   
    }
    function call2(byte bb){
        tokenAddr.call(bytes4(sha3("notify(byte,address)")),bb,userAddr);
    }
    function call3(byte bb){
        NotifyContract c=NotifyContract(tokenAddr);
        c.notify(bb,userAddr);
    }
}
