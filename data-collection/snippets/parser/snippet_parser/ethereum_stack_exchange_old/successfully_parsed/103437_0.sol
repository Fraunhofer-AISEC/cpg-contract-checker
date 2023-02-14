
pragma solidity ^0.8.0;

contract Foo {    
    
    function bar (bytes calldata data) public {
        (uint a, bytes calldata b, bytes calldata c) = abi.decode(data, (uint, bytes, bytes));
        
        qux(c);
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

        bar(data);
    }
}
