contract A {
    function foo() public pure virtual returns(string memory) {
        return "A";
    }
}

contract B is A {
    function foo() public pure virtual override returns(string memory) {
        return "B";
    }
}
contract C is A {
    function foo() public pure virtual override returns(string memory) {
        return "C";
    }
}
contract D is B, C {
    function foo() public pure virtual override(B, C) returns(string memory) {
        return super.foo();
    }
}
contract F is A, B {
    function foo() public pure virtual override(A, B) returns(string memory) {
        return super.foo();
    }
}

contract G is D, F {
    function foo() public pure virtual override(D, F) returns(string memory) {
        return super.foo();
    }
}
contract H is F, D {
    function foo() public pure virtual override(F, D) returns(string memory) {
        return super.foo();
    }
}
