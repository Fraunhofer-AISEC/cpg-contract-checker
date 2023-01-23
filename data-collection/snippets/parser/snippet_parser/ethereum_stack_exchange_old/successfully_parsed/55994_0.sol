contract A {
    uint256 public n;
    function set () public {
        n = 50;
    }
}

contract B is A {
    function set () public {
        n = 40;
    }
}

contract C is A,B {
    function test (uint n) public {
        A a;
        if (n==1){
            a = new A();
        } 
        else{
            a = B(new B());
        }
        a.set(); 
    }
}
