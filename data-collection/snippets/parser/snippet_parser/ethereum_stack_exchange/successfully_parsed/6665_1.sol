contract contractA {
    function blah(int x, int y) payable {}
}

contract contractB {
    function invokeContractA() { 
        contractA a = contractA(0x1234567891234567891234567891234567891234);
        uint ValueToSend = 1234;
        a.blah{value: ValueToSend}(2, 3);
    }  
}
