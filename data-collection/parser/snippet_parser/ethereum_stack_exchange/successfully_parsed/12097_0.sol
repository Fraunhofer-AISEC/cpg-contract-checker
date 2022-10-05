contract Quux {
    struct Foo {   string[] bar;     }
    mapping (address => Foo) foos;
    function Quux() { 
        foos[msg.sender] = Foo([]);
    }
}
