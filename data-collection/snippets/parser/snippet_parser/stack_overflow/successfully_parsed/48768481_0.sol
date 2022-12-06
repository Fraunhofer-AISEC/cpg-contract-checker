A.sol
import './B.sol';
contract A {
    event BCreated(address addressOfB);
    function createB(){
        B b = new B();   
        BCreated(b);
    }
}


B.sol
contract B {    
    uint8 value = 5;
    function getValue() constant returns(uint8){
        return value;
    }
}
