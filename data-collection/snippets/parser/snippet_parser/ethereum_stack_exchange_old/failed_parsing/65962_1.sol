contract A {
    address to = 0x***;
    function() payable external {
        
        require(to.call.gas(1150).value(msg.value)());
    }
}
