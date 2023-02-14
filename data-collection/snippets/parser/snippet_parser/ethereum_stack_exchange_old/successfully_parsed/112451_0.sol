pragma solidity ^0.8.0;

contract A {

    address systemAddress = 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266;

    constructor(){}

    function fromSystem(address from) public view {
        require(
            from == systemAddress,
            "Invalid transaction source"
        );
    }
}

contract B {

    A a;

    uint[] data;

    constructor(address contractA){
        a = A(contractA);
        data.push(10);
    }

    modifier fromSystem() {
        a.fromSystem(msg.sender);
        _;
    }

    function funcB() public fromSystem returns (uint256){
        
        return data[0];
    }
}

contract C {

    A a;
    B b;

    constructor(address contractA, address contractB){
        a = A(contractB);
        b = B(contractB);
    }

    modifier fromSystem() {
        a.fromSystem(msg.sender);
        _;
    }

    function funcC() public fromSystem {
        uint num = b.funcB();
        
    }
}

