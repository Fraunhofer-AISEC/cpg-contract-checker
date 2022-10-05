contract Child {
    uint i1;
    uint i2;
    uint i3;
    uint i4;
    uint i5;

    function f1() { i1=1;   }
    function f2() { i2=2;   }
    function f3() { i3=3;   }
    function f4() { i4=4;   }
    function f5() { i5=5;   }
}

contract MainFactory {
    Child ch;

    function MainFactory() {
        ch = new Child();
    }

    function test() {
        ch.f1();
        ch.f2();
        ch.f3();
        ch.f4();
        ch.f5();
    }
}

contract Main {
    Child ch;
    function Main(address child) {
        ch=(Child(child));
    }
    function test() {
        ch.f1();
        ch.f2();
        ch.f3();
        ch.f4();
        ch.f5();
    }
}
