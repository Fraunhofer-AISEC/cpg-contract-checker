library Constants {
    enum ClassTypes { A, B, C }
}

contract A {
    function getType() public pure returns(Constants.ClassTypes) {
        return Constants.ClassTypes.A;
    }
}
contract B is A {
    function getType() public pure returns(Constants.ClassTypes) {
        return Constants.ClassTypes.B;
    }
}
contract C is A {
    function getType() public pure returns(Constants.ClassTypes) {
        return Constants.ClassTypes.C;
    }
}

contract D {
    function test() public returns(string) {
        A[] memory examples = new A[](3);
        examples[0] = new A();
        examples[1] = new B();
        examples[2] = new C();

        if(examples[0].getType() == Constants.ClassTypes.A) {
            
        }
    }
}
