contract A {
    address public addressB;   
    address public sender;
    uint public myVar;

    function A() {
        addressB = new B();
    }

    function makeCall(){
        addressB.call(bytes4(sha3('set(uint256)')), 1);
    }
    function makeCallCode(){
        addressB.callcode(bytes4(sha3('set(uint256)')), 2);
    }
    function makeDelegateCall(){
        addressB.delegatecall(bytes4(sha3('set(uint256)')), 3);
    }

    function reset(){
        sender = 0;
        myVar = 0;
        B(addressB).reset();
    }
}

contract B {
    address public sender;
    uint public myVar;

    function set(uint x){
        myVar = x;
        sender = msg.sender;
    }
    function reset(){
        sender = 0;
        myVar = 0;        
    }
}
