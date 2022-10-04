contract OtherContract {

event MyEvent(uint8);
function doSomething() {
         MyEvent(1);
    }
}

contract Test {

    OtherContract constant otherContract  = OtherContract(0x0b258ee7bf483bb49a5956407702ca5b08197b4c);

    function testing() {
         otherContract.doSomething();        
    }
}
