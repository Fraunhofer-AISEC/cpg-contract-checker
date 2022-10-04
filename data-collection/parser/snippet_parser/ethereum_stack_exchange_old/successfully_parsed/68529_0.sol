library Foo {
    modifier nonZero (uint x) {
        require (x != 0);
        _;
    }

    function isPrime (uint x) public nonZero (x) returns (bool) {
        
    }
}

interface Bar {
    modifier onlyPrime (uint x) {
        require (Foo.isPrime (x));
        _;
    }
}

contract Zoo is Bar {
    function fooBar (uint x) public onlyPrime (x) {
        
    }
}
