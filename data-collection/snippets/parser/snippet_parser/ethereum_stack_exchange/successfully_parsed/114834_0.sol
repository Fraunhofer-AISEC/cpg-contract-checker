
pragma solidity ^0.8.0;

contract A {
    uint public a;

    constructor(uint x) {
        a = x;
    }

    function foo(uint y) public {
        a = y;
    }
}

contract B {
    A public a;

    event Result(uint);

    constructor() {
        
        a = new A(1);
    }

    function bar() public {
        
        a.foo(123);

        
        
        try a.foo{gas: 1000}(1111) {
            
            emit Result(8989);
        } catch (bytes memory) {
            
        }

        
        uint r = a.a();

        
        emit Result(r);
    }
}
