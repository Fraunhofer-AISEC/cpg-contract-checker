contract EventEmitter{
    event Emit(address addr, string message);

    
    
    function doEmit(string message) returns (bool){
        Emit(msg.sender, message);
        return true;
    }
}

contract EventEmitterCaller{
    event TestEvent(string message);

    function callDoEmit(string message) returns (bool){
        EventEmitter emitter = new EventEmitter();
        
        
        return emitter.doEmit(message);
    }

}
