contract caller {
    function makeCall(address first, address second){
        first.call.gas(100000).value(200000000000000000)(bytes4(bytes32(sha3('makeCall(address)'))), second);
    }
}

contract first {
    function makeCall(address second) {
        second.call.gas(100000).value(100000000000000000)(bytes4(bytes32(sha3('make()'))));
    }
}

contract second {
    uint public x = 1;
    function make(){
        x = 2;
    }
    function(){
        x = 3;
    }
}
