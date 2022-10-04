contract NotifyContract { 
    address public userAddr;
    byte public types;
    function notify(byte tokenByte,address userAddr_){
        types=tokenByte;
        userAddr=userAddr_;
    } 
}
