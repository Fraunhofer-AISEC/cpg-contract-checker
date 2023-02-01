contract Callee {

    event Log(address sender);
    
    function call() {
       emit Log(msg.sender);
    }
}
