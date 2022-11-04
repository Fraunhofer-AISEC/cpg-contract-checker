pragma solidity ^0.4.24;

contract C1 {

    event Sig(bytes4 sig);
    C2 c2;

    constructor(address c2Addr)public {
        c2 = C2(c2Addr);
    }

    function func1()public {
        bytes4 sigFromC2Func2 = c2.func2();
        emit Sig(sigFromC2Func2);
        bytes4 sigFromThisFunc2 = func2();
        emit Sig(sigFromThisFunc2);
    }

    function func2() pure private returns(bytes4) {
        return msg.sig;
    }
}

contract C2 {

    function func2() pure public returns(bytes4) {
        return msg.sig;
    }
}
