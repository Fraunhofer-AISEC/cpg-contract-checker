

pragma solidity >=0.7.0 <0.9.0;

contract concatenation {
    string public a;
    string public b;
    function ExampleFunction () external {
        a = string(abi.encode("hello", " world"));
        b = string(abi.encodePacked("hello", " world"));
    }

    
    

   function ExampleFunction2 () external {
        bool y=true;
        a = string(abi.encode(y, " world"));
        b = string(abi.encodePacked(y, " world"));
    }

    
    

    function ExampleFunction3 () external {
        bool y=true;
        uint256 nonce=123;
        a = string(abi.encode(y, nonce));
        b = string(abi.encodePacked(y, nonce));
    }

    
    
}
