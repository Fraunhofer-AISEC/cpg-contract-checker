pragma solidity 0.7.0;
abstract contract Foursix {
    function foursix() virtual public returns (bool);
}

abstract contract Seven {
    function seven() virtual public returns (bool);
}

contract Foo {
    function callfoursix(address a) public {
        Foursix fs = Foursix(a);
        bool b = fs.foursix();
    }
    function callseven(address a) public {
        Seven s = Seven(a);
        bool b = s.seven();
    }
}
