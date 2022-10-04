

contract Foo {
    
    function bar (bytes calldata data) public {
        (uint a, bytes memory b, bytes memory c) = abi.decode(data, (uint, bytes, bytes));
        this.qux(c);
    }
    
    
    function qux (bytes calldata data) public {
        
    }
    
    
    function baz (uint _a, bytes calldata _b, bytes calldata _c) public {
        uint a = _a;
        bytes calldata b = _b;
        bytes calldata c = _c;
        
        bytes memory data = abi.encode(
            a,
            b,
            c
        );
    
        this.bar(data);
    }
}
