
pragma solidity 0.8.17;

interface Itest {
     function sendToken(address to) external;
}

contract TestContract {

    Itest _Itest;

    constructor(address add) {
        _Itest = Itest(add);
    }

    function sendTokens(address to1, address to2) external {
        _Itest.sendToken(to1);
        _Itest.sendToken(to2);
}
    
}
