contract InterfaceOfA {
        function f(uint) returns (uint);
}

contract InterfaceOfB {
        function g(bool) returns (bool);
}

contract A is InterfaceOfA {
        InterfaceOfB b;
        function f(uint _input) returns (uint) {
                b.g(true);
                return 3;
        }
}

contract B is InterfaceOfB {
        InterfaceOfA a;
        function g(bool _input) returns (bool) {
                a.f(0);
                return false;
        }
}
