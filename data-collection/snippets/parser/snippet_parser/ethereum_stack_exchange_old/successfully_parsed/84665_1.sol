pragma solidity ^0.5.0;

library A {
    
    struct S {
        uint256 a;
    }
    
    function foo(A.S memory a) internal view returns (uint256) {
        return a.a;
    }
}

library B {
    
    using A for A.S;
    
    struct T {
        uint256 b;
    }
    
    function bar(B.T memory t, A.S memory s) internal view returns (uint256) {
        return s.foo() * 1000 + t.b;
    }
}

contract C {
    using B for B.T;
    
    A.S public k;
    B.T public l;
    
    function baz() public returns (uint256) {
        k = A.S(121);
        l = B.T(333);
        return l.bar(k);
    }
    
}

