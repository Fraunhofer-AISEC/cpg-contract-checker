pragma solidity 0.5.8;

contract contractA {
    event eventA();
    function methodA( address b ) public {
        emit eventA();
        contractB instanceB = contractB( b );
        instanceB.methodB();
    }
}

contract contractB {
    event eventB();
    function methodB() public {
        emit eventB();
    }
}
